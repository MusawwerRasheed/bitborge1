import 'package:bitborge/Application/NavigationServices/Navigation.dart';
import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/strings.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Common/appbar.dart';
import 'package:bitborge/Presentation/Common/button.dart';
import 'package:bitborge/Presentation/Widgets/Auth/Components/form_label.dart';
import 'package:bitborge/Presentation/Widgets/Auth/Components/form_text_field.dart';
import 'package:bitborge/Presentation/Widgets/Auth/create_account_screen.dart';
import 'package:bitborge/Presentation/Widgets/Auth/otp_screen.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/bottom_navigation_screen.dart';
import 'package:bitborge/Presentation/Widgets/Intro/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
 
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? emailcontroller;
  String? passwordcontroller;

  @override
  Widget build(BuildContext context) {
    // Initialize flutter_screenutil for responsive design
    ScreenUtil.init(context, designSize: Size(360, 640),  );
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      appBar: CustomAppBar(mainpic: SvgPicture.asset(Assets.logomajor)),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 30.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              formlabel(
                align: Alignment.topLeft,
                text: Strings.login,
                color: AppColors.whitecolor,
                fontSize: 25.sp,
              ),
              SizedBox(
                height: 10.h,
              ),
              formlabel(
                align: Alignment.topLeft,
                text: Strings.pleaseenter,
                color: AppColors.grettext,
                fontSize: 15.sp,
              ),
              SizedBox(
                height: 20.h,
              ),
              formlabel(
                align: Alignment.topLeft,
                text: 'Email',
                fontSize: 18.sp,
              ),
              SizedBox(height: 10.h),
              formtextfield(  
                hinttext: 'hellojohn@gmail.com',
                obscureval: false,
                icon: SvgPicture.asset(Assets.envolope),
              ),
              SizedBox(
                height: 10.h,
              ),
              formlabel(
                align: Alignment.topLeft,
                text: 'Password',
                fontSize: 18.sp,
              ),
              SizedBox(
                height: 10.h,
              ),
              formtextfield(
              hinttext: '*****',
                obscureval: true,
                righticon: SvgPicture.asset(Assets.eye),
                icon: SvgPicture.asset(Assets.lock),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigate.to(context, OTPScreen());
                },
                child: formlabel(
                  align: Alignment.topRight,
                  text: 'Forgot Password?',
                  color: AppColors.yellowcolor,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigate.to(context, SplashScreen());
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    button(
                      text: 'Login',
                      color: AppColors.yellowcolor,
                      function: () {
                        Navigate.to(context, BottomNavigationScreen());
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 150.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                   Strings.donthaveaccount,
                    style: Styles.montSerratRegular(context,
                        fontSize: 18.sp, color: AppColors.whitecolor),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigate.to(context, CreateAccount());
                    },
                    child: AppText(
                       Strings.createaccount,
                      style: Styles.montSerratRegular(context,
                          fontSize: 16.sp, color: AppColors.yellowcolor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
