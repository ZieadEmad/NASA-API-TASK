import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_task/business_layer/get_payload_cubit/states.dart';
import 'package:mega_task/data_layer/models/payload_model/main_model.dart';
import 'package:mega_task/domain_layer/end_points.dart';
import 'package:mega_task/domain_layer/remote.dart';

class GetPayloadCubit extends Cubit<GetPayloadStates> {
  GetPayloadCubit() : super(GetPayloadStateInitial());
  static GetPayloadCubit get(context) => BlocProvider.of(context);
  late PayloadModel payloadModel ;
  getPayloadData(payloadId){
    emit(GetPayloadStateLoading());
    DioHelper.getData(
        path:'$getPayloadEndPoint/$payloadId',
    ).then((value) {
      payloadModel = PayloadModel.fromJson(value.data);
      emit(GetPayloadStateSuccess(payloadModel));
    }).catchError((e)
    {
      if (e is DioError){
        emit(GetPayloadStateError('${e.response!.data['message']}'));
      } else {
       emit(GetPayloadStateError('$e'));
      }
    });
  }
}