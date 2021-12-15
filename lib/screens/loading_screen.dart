import 'package:flutter/material.dart';
import 'package:clima_app/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'fe9850dfa45dcb568bb1828212b8d94a';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    print('getting location1');
    Location location = Location();
    print('getting location2');
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    getData();
  }

  void getData() async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      var decodeData = jsonDecode(data);

      double temperature = decodeData['main']['temp'];
      int condition = decodeData['weather'][0]['id'];
      String cityName = decodeData['name'];

      print(temperature);
      print(condition);
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
