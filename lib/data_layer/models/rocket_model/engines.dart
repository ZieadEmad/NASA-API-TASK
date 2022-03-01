import 'package:mega_task/data_layer/models/rocket_model/isp.dart';
import 'package:mega_task/data_layer/models/rocket_model/thrust_sea_level.dart';
import 'package:mega_task/data_layer/models/rocket_model/thrust_vacuum.dart';

class Engines {
  late final Isp isp;
  late final ThrustSeaLevel thrustSeaLevel;
  late final ThrustVacuum thrustVacuum;
  late final num number;
  late final String type;
  late final String version;
  late final String layout;
  late final num engineLossMax;
  late final String propellant_1;
  late final String propellant_2;
  late final num thrustToWeight;
  Engines.fromJson(Map<String, dynamic> json){
    isp = Isp.fromJson(json['isp']);
    thrustSeaLevel = ThrustSeaLevel.fromJson(json['thrust_sea_level']);
    thrustVacuum = ThrustVacuum.fromJson(json['thrust_vacuum']);
    number = json['number'];
    type = json['type'];
    version = json['version'];
    layout = json['layout'];
    engineLossMax = json['engine_loss_max'];
    propellant_1 = json['propellant_1'];
    propellant_2 = json['propellant_2'];
    thrustToWeight = json['thrust_to_weight'];
  }
}