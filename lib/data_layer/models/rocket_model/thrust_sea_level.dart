class ThrustSeaLevel {
  late final num kN;
  late final num lbf;
  ThrustSeaLevel.fromJson(Map<String, dynamic> json){
    kN = json['kN'];
    lbf = json['lbf'];
  }
}