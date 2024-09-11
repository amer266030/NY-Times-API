import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nytimes/networking/network_mgr.dart';
import 'package:http/http.dart' as http;
import 'package:nytimes/networking/utils/from_json.dart';

import '../model/data.dart';

mixin GetNewsLogic on NetworkMgr {
  Future<Data> fetchNewsData(EndPoint endPoint, TimePeriod timePeriod) async {
    await dotenv.load(fileName: ".env");
    var key = dotenv.env['api_key'];

    final response = await http.get(Uri.parse(endPointPath(
        endPoint: endPoint, period: timePeriod, apiKey: key ?? '')));
    final jsonString = response.body;

    var newsData = await FromJson.decodeItem(
        responseBody: jsonString, fromJson: (json) => Data.fromJson(json));

    return newsData;
  }
}
