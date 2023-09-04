 import 'package:bitborge/Application/NavigationServices/Navigation.dart';
import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Presentation/Widgets/Intro/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

 class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 8), // Adjust the duration as needed
    );
    _animation = Tween(begin: 0.5, end: 1.2).animate(_controller);
    _controller.forward().whenComplete(() {   
    Navigate.to(context,IntroPage()); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF111422),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.applogo1),
                      SizedBox(width: 10),
                      SvgPicture.asset(Assets.applogo),
                    ],
                  ),
                );
              },
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

 
