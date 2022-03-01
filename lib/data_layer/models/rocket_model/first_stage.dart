import 'package:mega_task/data_layer/models/rocket_model/thrust_sea_level.dart';
import 'package:mega_task/data_layer/models/rocket_model/thrust_vacuum.dart';

class FirstStage {
  late final ThrustSeaLevel thrustSeaLevel;
  late final ThrustVacuum thrustVacuum;
  late final bool reusable;
  late final num engines;
  late final num fuelAmountTons;
  late final num burnTimeSec;
  FirstStage.fromJson(Map<String, dynamic> json){
    thrustSeaLevel = ThrustSeaLevel.fromJson(json['thrust_sea_level']);
    thrustVacuum = ThrustVacuum.fromJson(json['thrust_vacuum']);
    reusable = json['reusable'];
    engines = json['engines'];
    fuelAmountTons = json['fuel_amount_tons'];
    burnTimeSec = json['burn_time_sec'];
  }
}