import 'package:mega_task/data_layer/models/next_launch_model/main_model.dart';

abstract class GetNextLaunchStates {}

class GetNextLaunchStateInitial extends GetNextLaunchStates {}
class GetNextLaunchStateLoading extends GetNextLaunchStates {}
class GetNextLaunchStateSuccess extends GetNextLaunchStates {
  NextLaunchModel nextLaunchModel ;
  int finalDaysRange ;
  GetNextLaunchStateSuccess(this.nextLaunchModel,this.finalDaysRange);
}
class GetNextLaunchStateError extends GetNextLaunchStates{
  String error ;
  GetNextLaunchStateError(this.error);
}


