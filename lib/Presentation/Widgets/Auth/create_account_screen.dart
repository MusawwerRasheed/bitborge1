import 'package:bitborge/Application/NavigationServices/Navigation.dart';
import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/strings.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Common/appbar.dart';
import 'package:bitborge/Presentation/Common/button.dart';
import 'package:bitborge/Presentation/Common/check_box.dart';
import 'package:bitborge/Presentation/Widgets/Auth/Components/form_label.dart';
import 'package:bitborge/Presentation/Widgets/Auth/Components/form_text_field.dart';
import 'package:bitborge/Presentation/Widgets/Auth/login_screen.dart';
import 'package:bitborge/Presentation/Widgets/Auth/risk_warning.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/bottom_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
 




 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
                text: Strings.createaccount,
                color: AppColors.whitecolor,
                fontSize: 25.sp,
              ),
              SizedBox(
                height: 10.h,
              ),
            formlabel(
                align: Alignment.topLeft,
                text: Strings.pleaseenterbelow,
                color: AppColors.grettext,
                fontSize: 15.sp,
              ),
              SizedBox(
                height: 20.h,
              ),
              formlabel(
                align: Alignment.topLeft,
                text: 'Full Name',
                fontSize: 18.sp,
              ),
              SizedBox(height: 10.h),
              formtextfield(
                hinttext: 'Muzammil Afridi',
                obscureval: false,
                icon: SvgPicture.asset(Assets.user),
              ),
              SizedBox(
                height: 10.h,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  formlabel(
                    align: Alignment.topLeft,
                    text: 'Country',
                    fontSize: 18.sp,
                  ),
                  formlabel(
                    align: Alignment.topRight,
                    text: '(Optional)',
                    fontSize: 16.sp,
                    color: Color.fromARGB(255, 112, 102, 102),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              formtextfield(
                hinttext: 'Country',
                obscureval: false,
                icon: SvgPicture.asset(Assets.globe),
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
                hinttext: '*******',
                obscureval: true,
                righticon: SvgPicture.asset(Assets.eye),
                icon: SvgPicture.asset(Assets.lock),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Checkbox(
                    // Replace with your checkbox logic
                    value: false,
                    onChanged: (value) {},
                  ),
                  Row(
                    children: [
                      AppText(
                        Strings.doyouagree,
                        style: Styles.montSerratRegular(context,
                            fontSize: 11.sp, color: AppColors.grettext),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigate.toReplace(context, const RiskWarning());
                        },
                        child: Text(textScaleFactor: 1.0,
                          'Terms and conditions',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontFamily: "Montserrat Regular",
                            color: AppColors.grettext,
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromARGB(255, 105, 118,
                                129), // You can set the underline color if needed
                            decorationStyle: TextDecorationStyle
                                .solid, // You can adjust the underline style
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    // Replace with your checkbox logic
                    value: false,
                    onChanged: (value) {},
                  ),
                  AppText(
                    Strings.doyouacknowledge,
                    style: Styles.montSerratRegular(context,
                        fontSize: 11.sp, color: AppColors.grettext),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                button(
                    text: 'Create Account', 
                    color: AppColors.yellowcolor,
                    function: () {
                      Navigate.to(context, BottomNavigationScreen());
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    Strings.alreadyhaveacc,
                    style: Styles.montSerratRegular(context,
                        fontSize: 18.sp, color: AppColors.whitecolor),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigate.to(context, const LoginScreen());
                    },
                    child: AppText(
                      Strings.login,
                      style: Styles.montSerratRegular(context,
                          fontSize: 16.sp, color: AppColors.yellowcolor),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
