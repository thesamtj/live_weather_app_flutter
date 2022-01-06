import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    var url = Uri.parse(this.url);

    print('Url call: $url');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print('Network call returns error code: ${response.statusCode}');
      final String response2 =
          await rootBundle.loadString('sampleJSON/weather_response.json');
      final data = await json.decode(response2);

      return data;
    }
  }
}
