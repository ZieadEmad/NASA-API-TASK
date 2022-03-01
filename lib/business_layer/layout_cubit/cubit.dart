import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_task/business_layer/layout_cubit/states.dart';
import 'package:mega_task/ui_layer/screens/filter_launches/filter_launches_screen.dart';
import 'package:mega_task/ui_layer/screens/next_launch/next_launch_screen.dart';
import 'package:mega_task/ui_layer/screens/old_launches/old_launches_screen.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutStateInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);

  var widget = [
  const  NextLaunchScreen(),
  const  OldLaunchesScreen(),
  const  FilterLaunchesScreen(),
  ];

  int currentIndex = 0 ;
  changeIndex(index){
    currentIndex = index ;
    emit(LayoutStateIndex());
  }
}