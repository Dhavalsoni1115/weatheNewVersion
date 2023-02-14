import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp_new_version/screens/cityscreen.dart';
import '../services/location.dart';
import 'package:weatherapp_new_version/constants/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp_new_version/services/location.dart';
import 'package:weatherapp_new_version/services/network.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  dynamic weatherData;
  dynamic data;
  dynamic cityData;
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Future<dynamic> getData() async {
    Location location = Location();
    dynamic weatherData1 = await location.getCrurrentLocation();

    setState(() {
      weatherData = weatherData1;
      data = location.updateUI(weatherData);
      // print('............');
      //  print(cityData);
      // print(cityData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return data == null
        ? Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: SpinKitSpinningLines(
                color: Colors.white,
                size: 200,
                lineWidth: 5.0,
              ),
            ),
          )
        : Scaffold(
            backgroundColor: primeryColor,
            appBar: AppBar(
              backgroundColor: primeryColor,
              shadowColor: Colors.transparent,
              bottomOpacity: 0.5,
              title: Text(data['cityName']),
              titleTextStyle: TextStyle(fontSize: 25, color: Colors.white),
              actions: [
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      print('click');
                      getData();
                    });
                  },
                  child: Icon(
                    Icons.my_location,
                    size: 35,
                  ),
                ),
                SizedBox(width: 30),
                GestureDetector(
                  onTap: () async {
                    var cityData1 = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CityScreen(),
                      ),
                    );
                    //  print(cityData1);
                    Location location = Location();
                    var data1 = await location.getCityWeather(cityData1);
                    setState(() {
                      data = data1;
                    });
                  },
                  child: Icon(
                    Icons.add,
                    size: 40,
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/sunny.gif"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data['temp'].round().toString() + "°",
                          style:
                              TextStyle(fontSize: 110, color: secondaryColor),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text("☔"),
                                  Text(data['clouds'].toString() + "%"),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text("🧍"),
                                  Text(data['temp'].round().toString() + "°"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    data['weatherStatus'],
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  Container(
                    height: 280,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 100),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Details",
                            style: TextStyle(
                                //color: Colors.b,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Divider(
                          color: Colors.black54,
                          thickness: 4.0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text("Temp_Min:" +
                                    data['tempMin'].round().toString() +
                                    "°")),
                            Text("Temp_Max:" +
                                data['tempMax'].round().toString() +
                                "°"),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text("Sea_Level: " +
                                    data['seaLevel'].toString())),
                            Text("Ground_Level: " +
                                data['groundLevel'].toString()),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text("Humidity: " +
                                    data['humidity'].toString())),
                            Text("Visiblity: " +
                                data['visibility'].toString() +
                                " km"),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text("Wind_Speed: " +
                                    data['windSpeed'].round().toString() +
                                    " km/h")),
                            Text("Wind_gust: " +
                                data['windGust'].round().toString()),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Sunrise: " + data['sunrise'].toString(),
                              ),
                            ),
                            Text("Sunset: " + data['sunset'].toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
