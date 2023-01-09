
import 'package:flutter/material.dart';
import 'dart:async';
import 'pageSelector.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    PageSelector()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 13, 101, 217),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:const [
            Icon(
              Icons.car_repair,
              color: Colors.white,
              size: 71,
            ), 
            SizedBox(
              height: 15,
            ), 
            Text(
              'Delivery Liya', 
              style: TextStyle(
                fontSize: 23, 
                color: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
}