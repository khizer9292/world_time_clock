import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  String location; // name of the location for the UI
  static String time = ""; //time of that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDayTime = true; // True or false if daytime or not
  static String date = "";
  static String day = "";
  static DateTime currentTime = DateTime.now();

  WorldTime(this.location, this.flag, this.url);

  Future<void> getTime() async {
    try {
      final response = await http
          .get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // DateTime now = DateTime.parse(datetime);
      currentTime = DateTime.parse(datetime);
      currentTime = currentTime.add(Duration(hours: int.parse(offset)));
      // set the time property
      isDayTime = currentTime.hour > 6 && currentTime.hour < 20 ? true : false;
      updateFormattedTime();
    } catch (e) {
      print("caught error:$e");
      print('could not get time data');
    }
  }

  static void updateFormattedTime() {
    String formattedTime = DateFormat.jms().format(currentTime);
    String formattedDate =
        DateFormat.yMMMMd().format(currentTime); // Example: May 3, 2024
    String dayOfWeek = DateFormat.EEEE().format(currentTime);
    time = formattedTime;
    date = formattedDate;
    day = dayOfWeek;
    print("Time: $time date: $date day: $day");
  }

  static void startTimer(VoidCallback refresh) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      currentTime = currentTime.add(const Duration(seconds: 1));
      updateFormattedTime();
      refresh();
    });
  }
}
