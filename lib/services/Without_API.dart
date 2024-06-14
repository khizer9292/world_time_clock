import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TimeUtility {
  static DateTime currentTime = DateTime.now().toUtc();
  static String time = "";
  static String date = "";
  static String day = "";
  static String timeZoneName = "";
  static bool is24HourFormat = false; // Add this line
  static Duration timeZoneOffset =
      const Duration(hours: 5); // Default to Pakistan time zone

  static void updateTimeZoneOffset(String country) {
    switch (country) {
      case 'Pakistan':
        timeZoneOffset = const Duration(hours: 5); // UTC+5
        timeZoneName = 'Asia/Karachi';
        break;
      case 'UK':
        timeZoneOffset = const Duration(hours: 1); // UTC+1
        timeZoneName = 'Europe/London';
        break;
      case 'USA':
        timeZoneOffset = const Duration(hours: -4); // UTC-4 (EDT)
        timeZoneName = 'America/New_York';
        break;
      case 'Australia':
        timeZoneOffset = const Duration(hours: 10); // UTC+10
        timeZoneName = 'Australia/Sydney';
        break;
      case 'Canada':
        timeZoneOffset = const Duration(hours: -4); // UTC-4 (EDT)
        timeZoneName = 'America/Toronto';
        break;
      default:
        timeZoneOffset = const Duration(hours: 0); // UTC
        timeZoneName = 'Coordinated Universal Time';
        break;
    }
  }

  static void updateFormattedTime() {
    DateTime localTime = currentTime.add(timeZoneOffset);
    time = is24HourFormat
        ? DateFormat.Hms().format(localTime)
        : DateFormat.jms().format(localTime);
    date = DateFormat.yMMMMd().format(localTime); // Example: May 3, 2024
    day = DateFormat.EEEE().format(localTime);
  }

  static void startTimer(VoidCallback refresh) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      currentTime = DateTime.now().toUtc();
      updateFormattedTime();
      refresh();
    });
  }

  static void toggleTimeFormat(bool user24HourFormat) {
    is24HourFormat = user24HourFormat;
    updateFormattedTime();
  }
}
