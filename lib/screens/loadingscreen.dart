import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp_new_version/services/network.dart';
import '../services/network.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // NetworkHelper networkHelper = NetworkHelper();
    // var data = networkHelper.getLocation();
    // print(data);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(),
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 200,
          lineWidth: 5.0,
        ),
      ),
    );
  }
}
