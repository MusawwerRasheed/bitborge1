 import 'package:bitborge/Application/NavigationServices/Navigation.dart';
import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Presentation/Widgets/Intro/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> leftAnimation;
  late Animation<Offset> rightAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Adjust the duration for faster speed
    );

    leftAnimation = Tween<Offset>(
      begin: Offset(-2.0, 0.0), // Start from farther left
      end: Offset(0.0, 0.0),   // Slide to center
    ).animate(controller);

    rightAnimation = Tween<Offset>(
      begin: Offset(2.0, 0.0),  // Start from farther right
      end: Offset(0.0, 0.0),   // Slide to center
    ).animate(controller);

    controller.forward().whenComplete(() async {
      await Future.delayed(Duration(seconds: 2)); 
      Navigate.to(context, IntroPage());
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF111422),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: leftAnimation,
              child: SvgPicture.asset(Assets.applogo1),
            ),
            SizedBox(width: 10),
            SlideTransition(
              position: rightAnimation,
              child: SvgPicture.asset(Assets.applogo),
            ),
            
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

