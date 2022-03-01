class Reddit {
  late final String campaign;
  late final Null launch;
  late final Null media;
  late final String recovery;
  Reddit.fromJson(Map<String, dynamic> json){
    campaign = json['campaign'];
    launch = null;
    media = null;
    recovery = json['recovery'];
  }
}