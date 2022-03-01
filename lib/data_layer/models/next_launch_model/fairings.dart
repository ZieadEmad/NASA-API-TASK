class Fairings {
  late final Null reused;
  late final Null recoveryAttempt;
  late final Null recovered;
  late final List<dynamic> ships;
  Fairings.fromJson(Map<String, dynamic> json){
    reused = null;
    recoveryAttempt = null;
    recovered = null;
    ships = List.castFrom<dynamic, dynamic>(json['ships']);
  }
}