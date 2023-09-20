 import 'package:bitborge/Application/NavigationServices/Navigation.dart';
import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Presentation/Widgets/Intro/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

 
 import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

 



 import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _leftAnimation;
  late Animation<Offset> _rightAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Adjust the duration for faster speed
    );

    _leftAnimation = Tween<Offset>(
      begin: Offset(-2.0, 0.0), // Start from farther left
      end: Offset(0.0, 0.0),   // Slide to center
    ).animate(_controller);

    _rightAnimation = Tween<Offset>(
      begin: Offset(2.0, 0.0),  // Start from farther right
      end: Offset(0.0, 0.0),   // Slide to center
    ).animate(_controller);

    _controller.forward().whenComplete(() {
      // Navigate to the next screen after animation completes
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
              position: _leftAnimation,
              child: SvgPicture.asset(Assets.applogo1),
            ),
            SizedBox(width: 10),
            SlideTransition(
              position: _rightAnimation,
              child: SvgPicture.asset(Assets.applogo),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
