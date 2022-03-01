class Flickr {
  late final List<dynamic> small;
  late final List<dynamic> original;
  Flickr.fromJson(Map<String, dynamic> json){
    small = List.castFrom<dynamic, dynamic>(json['small']);
    original = List.castFrom<dynamic, dynamic>(json['original']);
  }
}