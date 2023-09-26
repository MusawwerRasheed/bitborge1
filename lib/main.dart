import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Presentation/Widgets/Intro/intro_screen.dart';
import 'package:bitborge/Presentation/Widgets/Intro/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
  

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Bit borge',
            theme: ThemeData(
              primaryColor: AppColors.primarycolor
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
             routes: {
        '/': (context) => SplashScreen(),
        '/introCarousel': (context) =>IntroPage(),
      },
          );
        });
  }
}




