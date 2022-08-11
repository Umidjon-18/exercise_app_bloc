import 'dart:convert';

import 'package:http/http.dart';

class Network {
  static const String baseURL = 'https://jsonplaceholder.typicode.com';
  Future<List<dynamic>> getData(String dataType) async {
    try {
      var response = await get(Uri.parse('$baseURL/$dataType'));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return [{}];
      }
    } catch (e) {
      throw Exception('Something went wrong with get response');
    }
  }
}
