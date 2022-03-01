import 'package:mega_task/data_layer/models/rocket_model/composite_fairing.dart';

class Payloads {
  late final CompositeFairing compositeFairing;
  late final String option_1;
  Payloads.fromJson(Map<String, dynamic> json){
    compositeFairing = CompositeFairing.fromJson(json['composite_fairing']);
    option_1 = json['option_1'];
  }
}
