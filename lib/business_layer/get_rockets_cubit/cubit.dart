import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_task/business_layer/get_rockets_cubit/states.dart';
import 'package:mega_task/data_layer/models/rocket_model/main_model.dart';
import 'package:mega_task/domain_layer/end_points.dart';
import 'package:mega_task/domain_layer/remote.dart';

class GetRocketsCubit extends Cubit<GetRocketsStates> {
  GetRocketsCubit() : super(GetRocketsStateInitial());
  static GetRocketsCubit get(context) => BlocProvider.of(context);
  late RocketModel rocketModel ;
  getRocketsData(rocketsId){
    emit(GetRocketsStateLoading());
    DioHelper.getData(
        path:'$getRocketsEndPoint/$rocketsId',
    ).then((value) {
      print(value.data);
      rocketModel = RocketModel.fromJson(value.data);
      emit(GetRocketsStateSuccess(rocketModel));
    }).catchError((e)
    {
      if (e is DioError){
        print(e.toString());
        emit(GetRocketsStateError('${e.response!.data['message']}'));
      } else {
        print(e.toString());
       emit(GetRocketsStateError('$e'));
      }
    });
  }
}