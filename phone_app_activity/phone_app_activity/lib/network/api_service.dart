import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
//create a singleton
  final http.Client _client;

  ApiService({http.Client? client}) : _client = client ?? http.Client();

  T _handleExcetion<T>(
    http.Response response,
    T Function(dynamic) parser,
  ) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        final dynamic data = jsonDecode(response.body);
        return parser(data);
      } catch (e) {
        throw ServerException();
      }
    } else {
      throw ServerException();
    }
  }
}

class ApiServiceCla {
// make this a singleton
  final http.Client _client;
  ApiServiceCla({http.Client? client}) : _client = client ?? http.Client();
}
