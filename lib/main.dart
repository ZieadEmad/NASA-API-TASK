import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_task/business_layer/layout_cubit/cubit.dart';
import 'package:mega_task/domain_layer/remote.dart';
import 'package:mega_task/ui_layer/helpers/constants/colors.dart';
import 'package:mega_task/ui_layer/screens/layout/layout_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 // await sharedPreferences();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> LayoutCubit())
      ],
      child: MaterialApp(
        title: 'SpaceX',
        theme: ThemeData(
          primarySwatch: defaultColor,
          primaryColor: defaultColor,
        ),
        home: const LayoutScreen(),
      ),
    );
  }
}

