import 'package:mega_task/data_layer/models/old_launches_model/old_launches_docs.dart';

class OldLaunchesModel {
  late final List<OldLaunchesDocs> docs;
  late final int totalDocs;
  late final int offset;
  late final int limit;
  late final int totalPages;
  late final int page;
  late final int pagingCounter;
  late final bool hasPrevPage;
  late final bool hasNextPage;
  late final Null prevPage;
  late final int nextPage;
  OldLaunchesModel.fromJson(Map<String, dynamic> json){
    docs = List.from(json['docs']).map((e)=>OldLaunchesDocs.fromJson(e)).toList();
    totalDocs = json['totalDocs'];
    offset = json['offset'];
    limit = json['limit'];
    totalPages = json['totalPages'];
    page = json['page'];
    pagingCounter = json['pagingCounter'];
    hasPrevPage = json['hasPrevPage'];
    hasNextPage = json['hasNextPage'];
    prevPage = null;
    nextPage = json['nextPage'];
  }
}














