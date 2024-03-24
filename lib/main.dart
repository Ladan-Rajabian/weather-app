import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/currentCityDataModel.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    sendRequestCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 182, 102, 196),
        title: const Text(
          'Weather App',
          style: TextStyle(),
        ),
        elevation: 10,
        actions: <Widget>[
          PopupMenuButton<String>(itemBuilder: (BuildContext context) {
            return {'Setting', 'logout'}.map((String choice) {
              return PopupMenuItem(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          })
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1593923416234-c99746aff9c8?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              fit: BoxFit.cover),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Find'),
                      ),
                      const Gap(15),
                      Expanded(
                          child: TextField(
                        controller: textEditingController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Enter city name',
                        ),
                      ))
                    ],
                  ),
                  const Gap(30),
                  Text(
                    'Montain View',
                    style: _mytextstyle.large,
                  ),
                  const Gap(40),
                  Text(
                    'Clear sky',
                    style: _mytextstyle.medium,
                  ),
                  const Gap(20),
                  Icon(Icons.sunny, color: Colors.white, size: 80),
                  const Gap(20),
                  Text(
                    '14\u00B0',
                    style: TextStyle(fontSize: 48, color: Colors.white),
                  ),
                  const Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Max',
                            style: _mytextstyle.medium,
                          ),
                          const Gap(5),
                          Text(
                            '16\u00B0',
                            style: _mytextstyle.medium,
                          ),
                        ],
                      ),
                      const Gap(10),
                      Container(
                        color: const Color.fromARGB(255, 226, 226, 226),
                        width: 1,
                        height: 45,
                      ),
                      const Gap(10),
                      const Column(
                        children: [
                          const Text(
                            'Min',
                            style: _mytextstyle.medium,
                          ),
                          const Gap(5),
                          Text(
                            '12\u00B0',
                            style: _mytextstyle.medium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Gap(40),
                  Container(
                    color: Color.fromARGB(255, 165, 165, 165),
                    height: 1,
                    width: double.infinity,
                  ),
                  const Gap(40),
                  Container(
                    width: double.infinity,
                    height: 100,
                    child: Center(
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (BuildContext context, int pos) {
                            return Container(
                              height: 60,
                              width: 70,
                              child: const Card(
                                elevation: 0,
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    Text(
                                      'Fri 8PM',
                                      style: _mytextstyle.small,
                                    ),
                                    Icon(
                                      Icons.cloud,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '14\u00B0',
                                      style: _mytextstyle.small,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 165, 165, 165),
                    height: 1,
                    width: double.infinity,
                  ),
                  const Gap(35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Column(
                        children: [
                          Text(
                            'Wind speed',
                            style: _mytextstyle.small,
                          ),
                          Gap(10),
                          Text(
                            '4.73 m/s',
                            style: _mytextstyle.small,
                          ),
                        ],
                      ),
                      Gap(10),
                      Container(
                        color: const Color.fromARGB(255, 226, 226, 226),
                        width: 1,
                        height: 45,
                      ),
                      Gap(15),
                      Column(
                        children: [
                          Text(
                            'Sun raise',
                            style: _mytextstyle.small,
                          ),
                          Gap(10),
                          Text(
                            '6:19 pm',
                            style: _mytextstyle.small,
                          ),
                        ],
                      ),
                      Gap(10),
                      Container(
                        color: const Color.fromARGB(255, 226, 226, 226),
                        width: 1,
                        height: 45,
                      ),
                      Gap(15),
                      Column(
                        children: [
                          Text(
                            'Sun set',
                            style: _mytextstyle.small,
                          ),
                          Gap(10),
                          Text(
                            '6:19 pm',
                            style: _mytextstyle.small,
                          ),
                        ],
                      ),
                      Gap(10),
                      Container(
                        color: const Color.fromARGB(255, 226, 226, 226),
                        width: 1,
                        height: 45,
                      ),
                      Gap(15),
                      Column(
                        children: [
                          Text(
                            'Humidity',
                            style: _mytextstyle.small,
                          ),
                          Gap(10),
                          Text(
                            '70%',
                            style: _mytextstyle.small,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void sendRequestCurrentWeather() async {
    var apiKey = '222c0bef7afb9b59c061a652e9760829';
    var cityName = 'Tehran';

    var response = await Dio().get(
        "https://api.openweathermap.org/data/2.5/weather",
        queryParameters: {'q': cityName, 'appid': apiKey, 'units': 'metric'});

    print(response.data);
    print(response.statusCode);

    var dataModel = CurrentCityDataModel(
        response.data['name'],
        response.data['coord']['lon'],
        response.data['coord']['lat'],
        response.data['weather'][0]['main'],
        response.data['weather'][0]['description'],
        response.data['main']['temp'],
        response.data['main']['temp_min'],
        response.data['main']['temp_max'],
        response.data['main']['pressure'],
        response.data['main']['humidity'],
        response.data['wind']['speed'],
        response.data['dt'],
        response.data['sys']['country'],
        response.data['sys']['sunrise'],
        response.data['sys']['sunset']);
  }
}

class _mytextstyle {
  static const large =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white);
  static const medium = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: Color.fromARGB(255, 244, 244, 244));
  static const small = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 255, 255, 255));
}
