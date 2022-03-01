import 'package:mega_task/data_layer/models/next_launch_model/cores.dart';
import 'package:mega_task/data_layer/models/next_launch_model/fairings.dart';
import 'package:mega_task/data_layer/models/next_launch_model/links.dart';

class NextLaunchModel {
  late final Fairings fairings;
  late final Links links;
  late final Null staticFireDateUtc;
  late final Null staticFireDateUnix;
  late final bool net;
  late final Null window;
  late final String rocket;
  late final Null success;
  late final List<dynamic> failures;
  late final Null details;
  late final List<dynamic> crew;
  late final List<dynamic> ships;
  late final List<dynamic> capsules;
  late final List<String> payloads;
  late final String launchpad;
  late final int flightNumber;
  late final String name;
  late final String dateUtc;
  late final int dateUnix;
  late final String dateLocal;
  late final String datePrecision;
  late final bool upcoming;
  late final List<Cores> cores;
  late final bool autoUpdate;
  late final bool tbd;
  late final String launchLibraryId;
  late final String id;
  NextLaunchModel.fromJson(Map<String, dynamic> json){
    fairings = Fairings.fromJson(json['fairings']);
    links = Links.fromJson(json['links']);
    staticFireDateUtc = null;
    staticFireDateUnix = null;
    net = json['net'];
    window = null;
    rocket = json['rocket'];
    success = null;
    failures = List.castFrom<dynamic, dynamic>(json['failures']);
    details = null;
    crew = List.castFrom<dynamic, dynamic>(json['crew']);
    ships = List.castFrom<dynamic, dynamic>(json['ships']);
    capsules = List.castFrom<dynamic, dynamic>(json['capsules']);
    payloads = List.castFrom<dynamic, String>(json['payloads']);
    launchpad = json['launchpad'];
    flightNumber = json['flight_number'];
    name = json['name'];
    dateUtc = json['date_utc'];
    dateUnix = json['date_unix'];
    dateLocal = json['date_local'];
    datePrecision = json['date_precision'];
    upcoming = json['upcoming'];
    cores = List.from(json['cores']).map((e)=>Cores.fromJson(e)).toList();
    autoUpdate = json['auto_update'];
    tbd = json['tbd'];
    launchLibraryId = json['launch_library_id'];
    id = json['id'];
  }
}




class NextLaunchModelTest {
  late final int? id;
  late final String? name;
  late final String? type;

  NextLaunchModelTest({ this.id, this.name, this.type});

  factory NextLaunchModelTest.fromJson(Map<String, dynamic> json){
    return NextLaunchModelTest(
      id: json['id'],
      name: json['id'],
      type: json['type'],
    );
  }

}

