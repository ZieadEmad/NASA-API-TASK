import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_task/business_layer/get_next_launch_cubit/cubit.dart';
import 'package:mega_task/business_layer/get_next_launch_cubit/states.dart';
import 'package:mega_task/ui_layer/helpers/constants/colors.dart';
import 'package:mega_task/ui_layer/shared_widgets/build_app_bar/build_app_bar.dart';
import 'package:mega_task/ui_layer/shared_widgets/image_place_holder/image_place_holder.dart';
import 'package:slide_countdown/slide_countdown.dart';

class NextLaunchScreen extends StatelessWidget {
  const NextLaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> GetNextLaunchCubit()..getNextLaunchData(),
      child: Scaffold(
        appBar: BuildAppBar(appBarTitle: 'Next Launch',),
        body: BlocBuilder<GetNextLaunchCubit,GetNextLaunchStates>(
          builder: (context,state){
            if(state is GetNextLaunchStateLoading){
              return const Center(child: CircularProgressIndicator(),);
            }
            if(state is GetNextLaunchStateError){
              Center(child: Text(state.error,style:const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ), softWrap: true,overflow: TextOverflow.ellipsis,maxLines: 3,),);
            }
            if(state is GetNextLaunchStateSuccess){
              return  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: ImagePlaceHolder(state.nextLaunchModel.links.patch.small),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/10,),
                  SlideCountdown(
                    duration:  Duration(days: state.finalDaysRange,),
                    countUp: false,
                  )
                ],
              );
            }
            return const SizedBox(height: 1,);
          },
        ),
      ),
    );
  }
}
