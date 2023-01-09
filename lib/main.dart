//import 'package:deliveryli/test/screens/Authentication/login.dart';
//import 'package:deliveryli/test/screens/Authentication/verification.dart';
//import 'package:deliveryli/test/screens/home.dart';
import 'package:deliveryli/app/screens/home.dart';
import 'package:deliveryli/app/screens/sliders/splash.dart';
import 'package:deliveryli/app/services/mapState.dart';
import 'package:flutter/material.dart';
//import 'test/components/splash.dart';
//import 'test/components/sliders.dart';
import 'app/navigationBar.dart';
//import 'test/screens/mapScreen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//import 'test/screens/forme.dart';
//import 'test/screens/Authentication/verification.dart';
import 'package:provider/provider.dart';
import './app/services/chatServices/chatNotifier.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ChatProvider()), 
        ChangeNotifierProvider.value(value: MapState()), 
      ], 
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const SplashScreen(),
    );
  }
}