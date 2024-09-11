import 'package:nytimes/networking/utils/api_authorization.dart';

abstract class NetworkMgr {
  String baseUrl = 'https://api.nytimes.com/svc/mostpopular/v2';
  String apiKey = '';
  Future<String> endPointPath({
    required EndPoint endPoint,
    required TimePeriod period,
  }) async {
    if (apiKey.isEmpty) {
      apiKey = await APIAuthorization.fetchApiKey();
    }
    return '$baseUrl/${endPoint.name}/${period.strValue}?api-key=$apiKey';
  }
}

enum EndPoint { emailed, shared, viewed }

enum TimePeriod { day, week, month }

extension Values on TimePeriod {
  String get strValue {
    switch (this) {
      case TimePeriod.day:
        return '1.json';
      case TimePeriod.week:
        return '7.json';
      case TimePeriod.month:
        return '30.json';
    }
  }
}
