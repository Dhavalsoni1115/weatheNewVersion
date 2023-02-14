import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  var name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 80),
                child: Text(
                  'Get Location',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white12,
                    icon: Icon(
                      Icons.location_city_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                    hintText: "Enter City Name",
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    name = value;
                  },
                ),
              ),
              FloatingActionButton(
                backgroundColor: Colors.white24,
                onPressed: () {
                  Navigator.pop(context, name);
                },
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 35,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
