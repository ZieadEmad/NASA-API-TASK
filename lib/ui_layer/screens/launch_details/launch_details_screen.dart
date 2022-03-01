import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_task/business_layer/get_payload_cubit/cubit.dart';
import 'package:mega_task/business_layer/get_payload_cubit/states.dart';
import 'package:mega_task/business_layer/get_rockets_cubit/cubit.dart';
import 'package:mega_task/business_layer/get_rockets_cubit/states.dart';
import 'package:mega_task/data_layer/models/payload_model/main_model.dart';
import 'package:mega_task/ui_layer/helpers/constants/colors.dart';
import 'package:mega_task/ui_layer/shared_widgets/build_app_bar/build_app_bar.dart';
import 'package:mega_task/ui_layer/widgets/launch_details_widgets/payload_item.dart';
import 'package:mega_task/ui_layer/widgets/launch_details_widgets/rocket_item.dart';
import 'package:mega_task/ui_layer/widgets/past_launches_widgets/past_launch_item.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LaunchDetailsScreen extends StatelessWidget {
  LaunchDetailsScreen({
    Key? key,
    required this.rocketId,
    required this.payloadId,
    required this.videoId,
    required this.launchName,
    required this.launchDate,
    required this.launchImage,
  }) : super(key: key);
  String rocketId;
  String payloadId;
  String videoId;
  String launchName;
  String launchDate;
  String launchImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(appBarTitle: 'Launch Details'),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GetPayloadCubit()..getPayloadData(payloadId)),
          BlocProvider(create: (context) => GetRocketsCubit()..getRocketsData(rocketId)),
        ],
        child: BlocConsumer<GetPayloadCubit, GetPayloadStates>(
          listener: (context, state) {},
          builder: (context, state) {
            late PayloadModel payloadModel = GetPayloadCubit.get(context).payloadModel;
            YoutubePlayerController _controller = YoutubePlayerController(initialVideoId: videoId.toString(),
                flags:const YoutubePlayerFlags(autoPlay: false, mute: true,
                ),);
            if (state is GetPayloadStateLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GetPayloadStateError) {
              Center(
                child: Text(
                  state.error,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              );
            }
            if (state is GetPayloadStateSuccess) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PastLaunchItem(
                      imagePath: launchImage,
                      details: launchName,
                      date: launchDate,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/90,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Payload Details',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          PayloadItem(
                            payloadName: payloadModel.name.toString(),
                            payloadType: payloadModel.type.toString(),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/90,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BlocBuilder<GetRocketsCubit, GetRocketsStates>(
                          builder: (context, state) {
                        if (state is GetRocketsStateLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is GetRocketsStateError) {
                          Center(
                            child: Text(
                              state.error,
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          );
                        }
                        if (state is GetRocketsStateSuccess) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Rocket Details',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              RocketItem(
                                  rocketName:  state.rocketModel.name,
                                  rocketType: state.rocketModel.type,
                              ),

                            ],
                          );
                        }
                        return const SizedBox(
                          height: 1,
                        );
                      }),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/90,),
                    Center(
                      child: InkWell(
                        onTap: (){},
                        child: YoutubePlayer(
                          controller: _controller,
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: defaultColor ,
                          progressColors: const ProgressBarColors(
                            playedColor: Colors.amber,
                            handleColor: Colors.amberAccent,
                          ),
                          onReady: (){
                            _controller.unMute();
                            // _controller.addListener(listener);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox(
              height: 1,
            );
          },
        ),
      ),
    );
  }
}
