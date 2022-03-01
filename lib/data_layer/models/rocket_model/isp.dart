class Isp {
  late final num seaLevel;
  late final num vacuum;
  Isp.fromJson(Map<String, dynamic> json){
    seaLevel = json['sea_level'];
    vacuum = json['vacuum'];
  }
}