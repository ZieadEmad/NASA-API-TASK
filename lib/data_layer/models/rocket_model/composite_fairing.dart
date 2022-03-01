import 'package:mega_task/data_layer/models/rocket_model/diameter.dart';
import 'package:mega_task/data_layer/models/rocket_model/height.dart';

class CompositeFairing {
  late final Height height;
  late final Diameter diameter;
  CompositeFairing.fromJson(Map<String, dynamic> json){
    height = Height.fromJson(json['height']);
    diameter = Diameter.fromJson(json['diameter']);
  }
}