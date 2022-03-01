class OldLaunchesFailures {
  late final int time;
  late final int? altitude;
  late final String reason;
  OldLaunchesFailures.fromJson(Map<String, dynamic> json){
    time = json['time'];
    altitude = null;
    reason = json['reason'];
  }
}