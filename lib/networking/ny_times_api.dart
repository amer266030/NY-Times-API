import 'package:nytimes/networking/network_mgr.dart';
import 'package:http/http.dart' as http;
import 'package:nytimes/networking/utils/from_json.dart';

import '../model/data.dart';

mixin NYTimesApi on NetworkMgr {
  Future<Data> fetchNewsData(EndPoint endPoint, TimePeriod timePeriod) async {
    var url = await endPointPath(endPoint: endPoint, period: timePeriod);
    final response = await http.get(Uri.parse(url));
    final jsonString = response.body;

    var newsData = await FromJson.decodeItem(
        responseBody: jsonString, fromJson: (json) => Data.fromJson(json));

    return newsData;
  }
}
