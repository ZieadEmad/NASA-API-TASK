class OldLaunchesFairings {
  late final bool? reused;
  late final bool? recoveryAttempt;
  late final bool? recovered;
  late final List<dynamic> ships;

  OldLaunchesFairings.fromJson(Map<String, dynamic> json){
    reused = null;
    recoveryAttempt = null;
    recovered = null;
    ships = List.castFrom<dynamic, dynamic>(json['ships']);
  }
}