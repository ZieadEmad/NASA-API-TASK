import 'package:mega_task/data_layer/models/rocket_model/diameter.dart';
import 'package:mega_task/data_layer/models/rocket_model/engines.dart';
import 'package:mega_task/data_layer/models/rocket_model/first_stage.dart';
import 'package:mega_task/data_layer/models/rocket_model/height.dart';
import 'package:mega_task/data_layer/models/rocket_model/landing_legs.dart';
import 'package:mega_task/data_layer/models/rocket_model/mass.dart';
import 'package:mega_task/data_layer/models/rocket_model/payload_weights.dart';
import 'package:mega_task/data_layer/models/rocket_model/second_stage.dart';

class RocketModel {
  late final Height height;
  late final Diameter diameter;
  late final Mass mass;
  late final FirstStage firstStage;
  late final SecondStage secondStage;
  late final Engines engines;
  late final LandingLegs landingLegs;
  late final List<PayloadWeights> payloadWeights;
  late final List<String> flickrImages;
  late final String name;
  late final String type;
  late final bool active;
  late final num stages;
  late final num boosters;
  late final num costPerLaunch;
  late final num successRatePct;
  late final String firstFlight;
  late final String country;
  late final String company;
  late final String wikipedia;
  late final String description;
  late final String id;

  RocketModel.fromJson(Map<String, dynamic> json){
    height = Height.fromJson(json['height']);
    diameter = Diameter.fromJson(json['diameter']);
    mass = Mass.fromJson(json['mass']);
    firstStage = FirstStage.fromJson(json['first_stage']);
    secondStage = SecondStage.fromJson(json['second_stage']);
    engines = Engines.fromJson(json['engines']);
    landingLegs = LandingLegs.fromJson(json['landing_legs']);
    payloadWeights = List.from(json['payload_weights']).map((e)=>PayloadWeights.fromJson(e)).toList();
    flickrImages = List.castFrom<dynamic, String>(json['flickr_images']);
    name = json['name'];
    type = json['type'];
    active = json['active'];
    stages = json['stages'];
    boosters = json['boosters'];
    costPerLaunch = json['cost_per_launch'];
    successRatePct = json['success_rate_pct'];
    firstFlight = json['first_flight'];
    country = json['country'];
    company = json['company'];
    wikipedia = json['wikipedia'];
    description = json['description'];
    id = json['id'];
  }
}
























