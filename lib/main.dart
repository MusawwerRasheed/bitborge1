import 'package:bitborge/Presentation/Widgets/Intro/intro_screen.dart';
import 'package:bitborge/Presentation/Widgets/Intro/splash_screen.dart';
import 'package:flutter/material.dart';
 
 
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash and Carousel',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/introCarousel': (context) =>IntroPage(),
      },
    );
  }
}