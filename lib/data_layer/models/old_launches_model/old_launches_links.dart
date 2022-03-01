import 'package:mega_task/data_layer/models/old_launches_model/old_launches_flicker.dart';
import 'package:mega_task/data_layer/models/old_launches_model/old_launches_patch.dart';
import 'package:mega_task/data_layer/models/old_launches_model/old_launches_reddit.dart';

class OldLaunchesLinks {
  late final OldLaunchesPatch patch;
  late final OldLaunchesReddit reddit;
  late final OldLaunchesFlickr flickr;
  late final String? presskit;
  late final String webcast;
  late final String youtubeId;
  late final String article;
  late final String wikipedia;

  OldLaunchesLinks.fromJson(Map<String, dynamic> json){
    patch = OldLaunchesPatch.fromJson(json['patch']);
    reddit = OldLaunchesReddit.fromJson(json['reddit']);
    flickr = OldLaunchesFlickr.fromJson(json['flickr']);
    presskit = null;
    webcast = json['webcast'];
    youtubeId = json['youtube_id'];
    article = json['article'];
    wikipedia = json['wikipedia'];
  }
}