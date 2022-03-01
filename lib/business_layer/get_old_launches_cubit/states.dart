
import 'package:mega_task/data_layer/models/old_launches_model/main_model.dart';

abstract class GetOldLaunchStates {}

class GetOldLaunchStateInitial extends GetOldLaunchStates {}

class GetOldLaunchStateLoading extends GetOldLaunchStates {}
class GetOldLaunchStateSuccess extends GetOldLaunchStates {
  OldLaunchesModel oldLaunchesModel ;
  int currentPage ;
  int totalPages ;
  GetOldLaunchStateSuccess(this.oldLaunchesModel,this.currentPage,this.totalPages);
}
class GetOldLaunchStateError extends GetOldLaunchStates{
  String error ;
  GetOldLaunchStateError(this.error);
}


class ChangePageIndexState extends GetOldLaunchStates {}