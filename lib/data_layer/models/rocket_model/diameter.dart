class Diameter {
  late final num meters;
  late final num feet;
  Diameter.fromJson(Map<String, dynamic> json){
    meters = json['meters'];
    feet = json['feet'];
  }
}