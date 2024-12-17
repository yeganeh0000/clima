import 'dart:ffi';

import '/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white10,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            SpinKitPulse(
              color: kLightColor,
              size: 100,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Fetching data...',
              style: TextStyle(
                fontSize: 20,
                color: kMidLightColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}