import 'package:flutter/material.dart';
import 'package:flutter_project/models/weather_model.dart';
import 'package:flutter_project/services/weather.dart';

import './weather.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "w",
                    style: TextStyle(
                      fontSize: 96,
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Weather',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Text(
                        'App',
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  'assets/Sun cloud angled rain.png',
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 20),
              _buildInputRow('Get current location', Icons.location_on),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputRow(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              onSubmitted: (value) async {
                WeatherModel weatherModel = await WeatherService().getWeather(
                  cityName: value,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Weather(weatherModel: weatherModel),
                  ),
                );
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFD9D9D9), 
                labelText: '',
                labelStyle: const TextStyle(color: Colors.black54),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black54,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30), 
                  borderSide: BorderSide.none, 
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF08244F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
            child: const Text(
              'Check',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
