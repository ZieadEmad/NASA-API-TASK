
import 'package:mega_task/data_layer/models/rocket_model/main_model.dart';

abstract class GetRocketsStates {}

class GetRocketsStateInitial extends GetRocketsStates {}

class GetRocketsStateLoading extends GetRocketsStates {}
class GetRocketsStateSuccess extends GetRocketsStates {
late RocketModel rocketModel ;
  GetRocketsStateSuccess(this.rocketModel);
}
class GetRocketsStateError extends GetRocketsStates{
  String error ;
  GetRocketsStateError(this.error);
}


