
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
  LocationPermission ? permission;

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
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.low,
      distanceFilter: 1000
    );

    Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
    print(position);
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
