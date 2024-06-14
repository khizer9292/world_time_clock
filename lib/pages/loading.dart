import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
// import 'package:world_time/services/World_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    // Navigate to home page after 6 seconds
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacementNamed(context, '/homepage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
