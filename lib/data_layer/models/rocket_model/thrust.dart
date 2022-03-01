class Thrust {
  late final num kN;
  late final num lbf;
  Thrust.fromJson(Map<String, dynamic> json){
    kN = json['kN'];
    lbf = json['lbf'];
  }
}