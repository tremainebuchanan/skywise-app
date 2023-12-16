import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:convert';

import 'package:skywise/services/location.dart';

import '../weather/models/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState(){
    super.initState();
    getLocation();
  }

  void getLocation() async{
    Location l = Location();
    await l.getLocation();
    log(l.toString());
  }

  void getData() async{
    http.Response r = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=1311d6b8b31c5272b1a09089c7d80243&units=metric'));
    Weather reading =  Weather.fromJson(r.body);
    log(reading.toString());
  }


  @override
  Widget build(BuildContext context) {
    getData();
    return const Scaffold(
      body: Center(
        child: Text('Get Location'),
      ),
    );
  }
}
