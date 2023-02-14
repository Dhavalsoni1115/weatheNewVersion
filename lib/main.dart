import 'package:flutter/material.dart';
import 'package:weatherapp_new_version/screens/cityscreen.dart';
import 'package:weatherapp_new_version/screens/loadingscreen.dart';
import 'package:weatherapp_new_version/screens/location_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocationScreen(),
    );
  }
}
