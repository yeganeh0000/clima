

import 'package:geolocator/geolocator.dart';

class LocationService {

  double ? latitude;
  double ? longitude;

  Future<void> getCurrentLocation()async {

    try{
      Position positionCurrent = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low
      );
      latitude = positionCurrent.latitude;
      longitude = positionCurrent.longitude;

    }catch(e){
      print("error get location $e");
    }
  }
}
