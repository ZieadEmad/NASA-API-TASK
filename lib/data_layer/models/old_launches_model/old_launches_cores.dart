class OldLaunchesCores {
  late final String core;
  late final int flight;
  late final bool gridfins;
  late final bool legs;
  late final bool reused;
  late final bool landingAttempt;
  late final Null landingSuccess;
  late final Null landingType;
  late final Null landpad;
  OldLaunchesCores.fromJson(Map<String, dynamic> json){
    core = json['core'];
    flight = json['flight'];
    gridfins = json['gridfins'];
    legs = json['legs'];
    reused = json['reused'];
    landingAttempt = json['landing_attempt'];
    landingSuccess = null;
    landingType = null;
    landpad = null;
  }

}