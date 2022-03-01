class PayloadWeights {
  late final String id;
  late final String name;
  late final num kg;
  late final num lb;
  PayloadWeights.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    kg = json['kg'];
    lb = json['lb'];
  }
}