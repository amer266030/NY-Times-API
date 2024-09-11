import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIAuthorization {
  static Future<String> fetchApiKey() async {
    try {
      await dotenv.load(fileName: ".env");
      var key = dotenv.env['api_key'];
      if (key == null) {
        throw Error();
      }
      return key;
    } catch (_) {
      if (kDebugMode) {
        print('ERROR: Could not find api key');
      }
    }
    return '';
  }
}
