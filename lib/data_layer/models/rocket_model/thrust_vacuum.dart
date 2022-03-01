
class ThrustVacuum {
  late final num kN;
  late final num lbf;
  ThrustVacuum.fromJson(Map<String, dynamic> json){
    kN = json['kN'];
    lbf = json['lbf'];
  }
}