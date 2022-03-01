
import 'package:mega_task/data_layer/models/next_launch_model/patch.dart';
import 'package:mega_task/data_layer/models/next_launch_model/reddit.dart';

import 'flickr.dart';

class Links {
  late final Patch patch;
  late final Reddit reddit;
  late final Flickr flickr;
  late final Null presskit;
  late final String webcast;
  late final String youtubeId;
  late final Null article;
  late final String wikipedia;

  Links.fromJson(Map<String, dynamic> json){
    patch = Patch.fromJson(json['patch']);
    reddit = Reddit.fromJson(json['reddit']);
    flickr = Flickr.fromJson(json['flickr']);
    presskit = null;
    webcast = json['webcast'];
    youtubeId = json['youtube_id'];
    article = null;
    wikipedia = json['wikipedia'];
  }
}