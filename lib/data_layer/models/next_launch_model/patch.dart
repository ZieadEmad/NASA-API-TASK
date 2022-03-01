class Patch {
  late final String small;
  late final String large;
  Patch.fromJson(Map<String, dynamic> json){
    small = json['small'];
    large = json['large'];
  }
}