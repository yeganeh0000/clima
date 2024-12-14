
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../config/api_service.dart';
import '../config/location_service.dart';
import '../utils/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
  LocationPermission ? permission;
  double? latitude, longitude;



  Future<void> getPermission()async{

    permission = await geolocatorPlatform.checkPermission();

    if(permission == LocationPermission.denied){
     // print("permission denied");
      permission = await geolocatorPlatform.requestPermission();
      if(permission != LocationPermission.denied){
        if(permission == LocationPermission.deniedForever){
          print("Permission permanently denied");
        }else{

          print("Permission graned");
          getLocation();
        }
      }else{
        print("User denied permission");
      }

    }else{

      getLocation();
    }
  }

  Future<void> getLocation()async{
    LocationService location = LocationService();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;
    ApiService apiService = ApiService(
        url:"http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey");
    var weatherData = await apiService.getData();
    print(weatherData);
  }

  @override
  void initState() {
    super.initState();
    getPermission();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: (){
              getPermission();
            },
            child: const Text("User Location",
            style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
