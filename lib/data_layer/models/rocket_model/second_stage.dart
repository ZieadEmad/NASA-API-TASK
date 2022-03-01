import 'package:mega_task/data_layer/models/rocket_model/payloads.dart';
import 'package:mega_task/data_layer/models/rocket_model/thrust.dart';

class SecondStage {
  late final Thrust thrust;
  late final Payloads payloads;
  late final bool reusable;
  late final num engines;
  late final double fuelAmountTons;
  late final num burnTimeSec;

  SecondStage.fromJson(Map<String, dynamic> json){
    thrust = Thrust.fromJson(json['thrust']);
    payloads = Payloads.fromJson(json['payloads']);
    reusable = json['reusable'];
    engines = json['engines'];
    fuelAmountTons = json['fuel_amount_tons'];
    burnTimeSec = json['burn_time_sec'];
  }
}