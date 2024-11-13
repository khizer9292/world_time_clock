import 'package:flutter/material.dart';

import '../services/World_time.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    void setupPakistanTime() async {
      WorldTime instance = WorldTime('Islamabad', 'pk.png', 'Asia/Karachi');
      await instance.getTime();

      Navigator.pushNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': WorldTime.time,
        'isDaytime': instance.isDayTime,
      });
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Center(
              child: Text(
                'World Clock',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 30),
              ),
            )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'HELLO WORLD!!',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/liveTime');
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.blue),
                    minimumSize: WidgetStateProperty.all(const Size(150, 50)),
                  ),
                  child: const Text(
                    'LIVE TIME',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    setupPakistanTime();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.blue),
                    minimumSize: WidgetStateProperty.all(const Size(150, 50)),
                  ),
                  child: const Text(
                    'API Time',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
