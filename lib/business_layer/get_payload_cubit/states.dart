

import 'package:mega_task/data_layer/models/payload_model/main_model.dart';

abstract class GetPayloadStates {}

class GetPayloadStateInitial extends GetPayloadStates {}

class GetPayloadStateLoading extends GetPayloadStates {}
class GetPayloadStateSuccess extends GetPayloadStates {
  PayloadModel payloadModel ;
  GetPayloadStateSuccess(this.payloadModel);
}
class GetPayloadStateError extends GetPayloadStates{
  String error ;
  GetPayloadStateError(this.error);
}


