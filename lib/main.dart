import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/homepage.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/LiveTime.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/homepage': (context) => const HomePage(),
        '/home': (context) => const Home(),
        '/liveTime': (context) => const LiveTime(),
        '/location': (context) => const ChooseLocation(),
      },
    ));
