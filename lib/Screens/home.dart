import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController cityController = TextEditingController();

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Column(
                children: [
                  Text(
                    'W',
                    style: TextStyle(
                      fontSize: 96,
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'weather',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'App',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        SizedBox(height: 50,),
       
        Image(image: AssetImage('assets/Sun cloud angled rain.png'),),
        SizedBox(height: 50,),

        Row(
          children: [
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                hintText: 'Enter City Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/weather', arguments: {
                  'city': cityController.text,
                });
              },
              child: Text('Get Weather'),
            ),
          ],
        )


        
                
        ],
      ),
    );
  }
}