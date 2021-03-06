import 'package:mega_task/data_layer/models/old_launches_model/old_launches_cores.dart';
import 'package:mega_task/data_layer/models/old_launches_model/old_launches_failures.dart';
import 'package:mega_task/data_layer/models/old_launches_model/old_launches_firings.dart';
import 'package:mega_task/data_layer/models/old_launches_model/old_launches_links.dart';

class OldLaunchesDocs {
  late final OldLaunchesFairings? fairings;
  late final OldLaunchesLinks links;
  late final String? staticFireDateUtc;
  late final int? staticFireDateUnix;
  late final bool net;
  late final int window;
  late final String rocket;
  late final bool success;
  late final List<OldLaunchesFailures> failures;
  late final String? details;
  late final List<dynamic> crew;
  late final List<String> ships;
  late final List<String> capsules;
  late final List<String> payloads;
  late final String launchpad;
  late final int flightNumber;
  late final String name;
  late final String dateUtc;
  late final int dateUnix;
  late final String dateLocal;
  late final String datePrecision;
  late final bool upcoming;
  late final List<OldLaunchesCores> cores;
  late final bool autoUpdate;
  late final bool tbd;
  late final Null launchLibraryId;
  late final String id;
  OldLaunchesDocs.fromJson(Map<String, dynamic> json){
    fairings = null;
    links = OldLaunchesLinks.fromJson(json['links']);
    staticFireDateUtc = '${json['static_fire_date_utc']}';
    staticFireDateUnix = null ;
    net = json['net'];
    window = json['window'];
    rocket = json['rocket'];
    success = json['success'];
    failures = List.from(json['failures']).map((e)=>OldLaunchesFailures.fromJson(e)).toList();
    details = '${json['details']}';
    crew = List.castFrom<dynamic, dynamic>(json['crew']);
    ships = List.castFrom<dynamic, String>(json['ships']);
    capsules = List.castFrom<dynamic, String>(json['capsules']);
    payloads = List.castFrom<dynamic, String>(json['payloads']);
    launchpad = json['launchpad'];
    flightNumber = json['flight_number'];
    name = json['name'];
    dateUtc = json['date_utc'];
    dateUnix = json['date_unix'];
    dateLocal = json['date_local'];
    datePrecision = json['date_precision'];
    upcoming = json['upcoming'];
    cores = List.from(json['cores']).map((e)=>OldLaunchesCores.fromJson(e)).toList();
    autoUpdate = json['auto_update'];
    tbd = json['tbd'];
    launchLibraryId = null;
    id = json['id'];
  }
}