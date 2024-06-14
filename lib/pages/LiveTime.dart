import 'package:flutter/material.dart';
import '../services/Without_API.dart';

class LiveTime extends StatefulWidget {
  const LiveTime({super.key});

  @override
  State<LiveTime> createState() => _LiveTimeState();
}

class _LiveTimeState extends State<LiveTime> {
  String _selectedCountry = 'Pakistan'; // Initial selected country
  String TimeZone = 'Pakistan';
  String formatOfTime = 'AM/PM';
  @override
  void initState() {
    super.initState();
    TimeUtility.startTimer(() {
      setState(() {});
    });
    _updateTimeZone(_selectedCountry);
  }

  void _updateTimeZone(String country) {
    TimeUtility.updateTimeZoneOffset(country);
    setState(() {
      _selectedCountry = country; // Update selected country
      TimeUtility.updateFormattedTime();
    });
  }

  void _updateTimeFormat(String format) {
    setState(() {
      formatOfTime = format;
      TimeUtility.toggleTimeFormat(format == '24 Hour');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          'LIVE TIME',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Current Time',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 5),
            Text(
              TimeUtility.time,
              style: const TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              TimeUtility.date,
              style: const TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              TimeUtility.day,
              style: const TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              TimeUtility.timeZoneName,
              style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCountryButton('UK'),
                _buildCountryButton('USA'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCountryButton('Canada'),
                _buildCountryButton('Pakistan'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCountryButton('Australia'),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Theme(
                  data: Theme.of(context).copyWith(
                      radioTheme: RadioThemeData(
                          fillColor: MaterialStatePropertyAll(Colors.white))),
                  child: RadioMenuButton(
                    style: ButtonStyle(
                        overlayColor: MaterialStatePropertyAll(Colors.white),
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)))),
                    value: 'AM/PM',
                    groupValue: formatOfTime,
                    onChanged: (value) {
                      _updateTimeFormat(value.toString());
                    },
                    child: const Text(
                      'AM/PM',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                      radioTheme: RadioThemeData(
                          fillColor: MaterialStatePropertyAll(Colors.white))),
                  child: RadioMenuButton(
                    style: ButtonStyle(
                        overlayColor: MaterialStatePropertyAll(Colors.white),
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)))),
                    value: '24 Hour',
                    groupValue: formatOfTime,
                    onChanged: (value) {
                      _updateTimeFormat(value.toString());
                    },
                    child: const Text(
                      '24 Hour',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountryButton(String country) {
    bool isSelected = _selectedCountry == country;
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(isSelected ? Colors.red : Colors.blue),
        minimumSize: MaterialStateProperty.all(const Size(150, 50)),
      ),
      onPressed: () => _updateTimeZone(country),
      child: Text(
        country,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
