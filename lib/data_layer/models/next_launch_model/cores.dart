
class Cores {
  late final Null core;
  late final Null flight;
  late final bool gridfins;
  late final bool legs;
  late final bool reused;
  late final bool landingAttempt;
  late final Null landingSuccess;
  late final Null landingType;
  late final Null landpad;
  Cores.fromJson(Map<String, dynamic> json){
    core = null;
    flight = null;
    gridfins = json['gridfins'];
    legs = json['legs'];
    reused = json['reused'];
    landingAttempt = json['landing_attempt'];
    landingSuccess = null;
    landingType = null;
    landpad = null;
  }
}