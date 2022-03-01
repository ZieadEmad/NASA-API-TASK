class Mass {
  late final num kg;
  late final num lb;
  Mass.fromJson(Map<String, dynamic> json){
    kg = json['kg'];
    lb = json['lb'];
  }
}
