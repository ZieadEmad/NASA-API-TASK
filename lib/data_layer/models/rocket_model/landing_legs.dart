class LandingLegs {
  late final num number;
  late final Null material;
  LandingLegs.fromJson(Map<String, dynamic> json){
    number = json['number'];
    material = null;
  }
}