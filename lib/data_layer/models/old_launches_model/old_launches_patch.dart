class OldLaunchesPatch {
  late final String small;
  late final String large;
  OldLaunchesPatch.fromJson(Map<String, dynamic> json){
    small = json['small'];
    large = json['large'];
  }
}