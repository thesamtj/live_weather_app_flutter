import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    print('getting location3');
    try {
      print('getting location4');
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print('getting location5');
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print('getting location6');
      print(e);
    }
  }
}
