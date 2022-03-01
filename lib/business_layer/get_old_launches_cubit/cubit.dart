import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_task/business_layer/get_next_launch_cubit/states.dart';
import 'package:mega_task/business_layer/get_old_launches_cubit/states.dart';
import 'package:mega_task/data_layer/models/next_launch_model/main_model.dart';
import 'package:mega_task/data_layer/models/old_launches_model/main_model.dart';
import 'package:mega_task/domain_layer/end_points.dart';
import 'package:mega_task/domain_layer/remote.dart';
import 'package:mega_task/ui_layer/screens/next_launch/next_launch_screen.dart';

class GetOldLaunchesCubit extends Cubit<GetOldLaunchStates> {
  GetOldLaunchesCubit() : super(GetOldLaunchStateInitial());
  static GetOldLaunchesCubit get(context) => BlocProvider.of(context);
  late OldLaunchesModel oldLaunchesModel ;
  int currentPage = 1 ;
  int totalPages = 0 ;
  getOldLaunchesData(page){
    emit(GetOldLaunchStateLoading());
    DioHelper.postData(
      data: {
        '':''
      },
        path: getPastWithQueryLaunchesEndPoint,
        query: {
          'page': currentPage
      }
    ).then((value) {
      oldLaunchesModel = OldLaunchesModel.fromJson(value.data);
      currentPage = int.parse('${oldLaunchesModel.page}');
      totalPages = int.parse('${oldLaunchesModel.totalPages}');
      emit(GetOldLaunchStateSuccess(oldLaunchesModel,currentPage,totalPages));
    }).catchError((e)
    {
      if (e is DioError){
        print(e.toString());
        emit(GetOldLaunchStateError('${e.response!.data['message']}'));
      } else {
        print(e.toString());
       emit(GetOldLaunchStateError('$e'));
      }
    });
  }
  changeCurrentPage(){
    if(currentPage < totalPages){
      currentPage ++ ;
      emit(ChangePageIndexState());
    }
  }
  changeCurrentPageDown(){
    if(currentPage == totalPages || currentPage < totalPages && currentPage != 1){
      currentPage -- ;
      emit(ChangePageIndexState());
    }
  }
}