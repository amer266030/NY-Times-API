import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nytimes/networking/network_mgr.dart';
import 'package:http/http.dart' as http;

mixin GetNewsLogic on NetworkMgr {
  getNews(EndPoint endPoint, TimePeriod timePeriod) async {
    await dotenv.load(fileName: ".env");
    var key = dotenv.env['api_key'];
    print('Key is: $key');

    var response = await http.get(Uri.parse(endPointPath(
        endPoint: endPoint, period: timePeriod, apiKey: key ?? '')));

    var jsonString = response.body;

    print(jsonString);
  }
}
