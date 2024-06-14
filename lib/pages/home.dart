import 'package:flutter/material.dart';
import 'package:world_time/services/World_time.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  void initState() {
    super.initState();

    WorldTime.startTimer(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    // print("Data: $data");

    //set background image
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color? bgColor = data['isDaytime'] ? Colors.black : Colors.black;

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: const Center(
            child: Text(
              "International Clock",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Center(
                child: Column(children: <Widget>[
                  TextButton.icon(
                    icon: const Icon(
                      Icons.edit_location,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Edit location',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag'],
                          'date': result['date'],
                          'day': result['day']
                        };
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          data['location'],
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    WorldTime.time, // Use the 'time' variable here
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    WorldTime.date,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    WorldTime.day,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ));
  }
}
