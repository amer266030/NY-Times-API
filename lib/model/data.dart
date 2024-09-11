import 'package:nytimes/model/result.dart';

class Data {
  String status;
  String copyright;
  int numResults;
  List<Result> results;

  Data({
    required this.status,
    required this.copyright,
    required this.numResults,
    required this.results,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        copyright: json["copyright"],
        numResults: json["num_results"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "copyright": copyright,
        "num_results": numResults,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
