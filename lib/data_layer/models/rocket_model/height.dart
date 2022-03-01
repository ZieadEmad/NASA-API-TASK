class Height {
  late final num meters;
  late final num feet;
  Height.fromJson(Map<String, dynamic> json){
    meters = json['meters'];
    feet = json['feet'];
  }
}