import 'package:http/http.dart' as http;

import '../config/app_config.dart';

class ApiClient {
  static Future<http.Response> get(String path) {
    return http.get(
      Uri.parse('${AppConfig.apiBaseUrl}$path'),
      headers: {
        'Accept': 'application/json',
      },
    );
  }
}