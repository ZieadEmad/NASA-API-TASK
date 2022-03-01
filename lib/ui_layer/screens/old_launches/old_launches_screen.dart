import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_task/business_layer/get_old_launches_cubit/cubit.dart';
import 'package:mega_task/business_layer/get_old_launches_cubit/states.dart';
import 'package:mega_task/data_layer/models/old_launches_model/main_model.dart';
import 'package:mega_task/ui_layer/helpers/constants/colors.dart';
import 'package:mega_task/ui_layer/helpers/navigations/navigations.dart';
import 'package:mega_task/ui_layer/helpers/text_trim/text_trim.dart';
import 'package:mega_task/ui_layer/screens/launch_details/launch_details_screen.dart';
import 'package:mega_task/ui_layer/shared_widgets/build_app_bar/build_app_bar.dart';
import 'package:mega_task/ui_layer/shared_widgets/build_toast/build_toast.dart';
import 'package:mega_task/ui_layer/widgets/past_launches_widgets/past_launch_item.dart';

class OldLaunchesScreen extends StatelessWidget {
  const OldLaunchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(appBarTitle: 'Past Launch',),
      body: BlocProvider(
        create: (context) => GetOldLaunchesCubit()..getOldLaunchesData(1),
        child: BlocConsumer<GetOldLaunchesCubit, GetOldLaunchStates>(
          listener: (context, state) {},
          builder: (context, state) {
            int currentPage = GetOldLaunchesCubit.get(context).currentPage;
            int totalPages = GetOldLaunchesCubit.get(context).totalPages;
           late OldLaunchesModel oldLaunchesModel =  GetOldLaunchesCubit.get(context).oldLaunchesModel;
            return ConditionalBuilder(
              condition: state is GetOldLaunchStateLoading,
              builder: (context)=>const Center(child: CircularProgressIndicator(),),
              fallback:(context)=> ConditionalBuilder(
                condition: state is GetOldLaunchStateError,
                builder: (context)=>const Center(child: Text('ERROR'),),
                fallback: (context)=> ConditionalBuilder(
                  condition: oldLaunchesModel != null || state is GetOldLaunchStateSuccess || state is ChangePageIndexState,
                  builder: (context)=> Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height/80,),
                          Expanded(
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context,index)=> InkWell(
                                onTap: (){
                                  navigateTo(context, LaunchDetailsScreen(
                                      rocketId: oldLaunchesModel.docs[index].rocket,
                                      payloadId: oldLaunchesModel.docs[index].payloads[0],
                                      videoId: oldLaunchesModel.docs[index].links.youtubeId,
                                      launchName: '${oldLaunchesModel.docs[index].details}',
                                      launchDate: oldLaunchesModel.docs[index].dateUtc,
                                      launchImage: oldLaunchesModel.docs[index].links.patch.small,
                                  ));
                                },
                                child: PastLaunchItem(
                                  imagePath: oldLaunchesModel.docs[index].links.patch.small,
                                  details: '${oldLaunchesModel.docs[index].details}',
                                  date: oldLaunchesModel.docs[index].dateUtc,
                                ),
                              ),
                              separatorBuilder: (context,state)=> SizedBox(height: MediaQuery.of(context).size.height/250,),
                              itemCount: oldLaunchesModel.docs.length,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: (){
                                    if(currentPage == 1){
                                      showToast(text: 'You in first page', error: true);
                                    }
                                    if(currentPage == totalPages || currentPage < totalPages && currentPage != 1){
                                      GetOldLaunchesCubit.get(context).changeCurrentPageDown();
                                      GetOldLaunchesCubit.get(context).getOldLaunchesData(currentPage);
                                    }
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width/2.8,
                                    height: 50,
                                    color: Colors.red,
                                    child:const Center(child: Text('Back',style: TextStyle(color: Colors.white),)),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const SizedBox(width: 4,),
                                    Text(currentPage.toString(),style: TextStyle(color: currentPage == totalPages? Colors.red : defaultColor,fontWeight: FontWeight.bold,fontSize: 16),),
                                    const SizedBox(width: 4,),
                                    const Text('-',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                    const SizedBox(width: 4,),
                                    Text(totalPages.toString(),style: const TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 16),),
                                    const SizedBox(width: 4,),
                                  ],
                                ),
                                InkWell(
                                  onTap: (){
                                    if(currentPage == totalPages){
                                      showToast(text: 'Cant find next page', error: true);
                                    }
                                    if(currentPage != totalPages){
                                      GetOldLaunchesCubit.get(context).getOldLaunchesData(currentPage);
                                    }
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width/2.8,
                                    height: 50,
                                    color: defaultColor,
                                    child:const Center(child: Text('Next',style: TextStyle(color: Colors.white),)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                  ),
                  fallback: (context)=>const Center(child: CircularProgressIndicator(),),

                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
