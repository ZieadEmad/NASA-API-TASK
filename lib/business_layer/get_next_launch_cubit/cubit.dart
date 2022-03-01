import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_task/business_layer/get_next_launch_cubit/states.dart';
import 'package:mega_task/data_layer/models/next_launch_model/main_model.dart';
import 'package:mega_task/domain_layer/end_points.dart';
import 'package:mega_task/domain_layer/remote.dart';
import 'package:mega_task/ui_layer/screens/next_launch/next_launch_screen.dart';

class GetNextLaunchCubit extends Cubit<GetNextLaunchStates> {
  GetNextLaunchCubit() : super(GetNextLaunchStateInitial());
  static GetNextLaunchCubit get(context) => BlocProvider.of(context);
  late NextLaunchModel nextLaunchModel ;

  int finalDaysRange = 0;

  daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    finalDaysRange = (to.difference(from).inHours / 24).round();
  }

  getNextLaunchData(){
    emit(GetNextLaunchStateLoading());
    DioHelper.getData(
        path: getNextLaunchEndPoint,
    ).then((value) {
      nextLaunchModel = NextLaunchModel.fromJson(value.data);
    daysBetween(DateTime.now(),DateTime.parse(nextLaunchModel.dateUtc));
      emit(GetNextLaunchStateSuccess(nextLaunchModel,finalDaysRange));
    }).catchError((e)
    {
      if (e is DioError){
        emit(GetNextLaunchStateError('${e.response!.data['message']}'));
      } else {
       emit(GetNextLaunchStateError('$e'));
      }
    });
  }

}