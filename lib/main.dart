import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/presentation/screens/splash_screen.dart';
import 'package:whatsapp_clone/presentation/widgets/theme/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Whatsapp Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),

      debugShowCheckedModeBanner: false,

      // defaultTransition: Transition.r,
    );
  }
}
