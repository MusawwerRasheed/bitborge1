import 'package:bitborge/Application/NavigationServices/Navigation.dart';
import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/strings.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Common/appbar.dart';
import 'package:bitborge/Presentation/Common/button.dart';
import 'package:bitborge/Presentation/Widgets/Auth/Components/form_text_field.dart';
import 'package:bitborge/Presentation/Widgets/Auth/login_screen.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/Components/custom_drawer.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/Controller/bottom_navigation_notifier.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/Gems/gems_screen.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/News/news_detail_screen.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/Signals/signals_screen.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/home/homescreen.dart';
import 'package:bitborge/Presentation/Widgets/Intro/splash_screen.dart';
import 'package:bitborge/Presentation/Widgets/Notification/Components/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';





class customdialog extends StatelessWidget {
  final SvgPicture? mainsvg;
  final String? dialoginput; 
  final String? dialogbuttontext;
  final String? dialogpara;
  final String? dialogtitle;
  const customdialog({
    this.dialogbuttontext, 
    this.dialoginput, 
    this.dialogpara, 
    this.dialogtitle, 
     this.mainsvg,     super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top:18),
          child: Dialog(
            backgroundColor: AppColors.secondarycolor,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.5,
              child: Column(  
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(
                                    top: 20, right: 10.0),
                            child: SvgPicture.asset(
                                Assets.crosscircle),
                          ))),
                  
                  mainsvg??SvgPicture.asset(Assets.timequarter),
                  
                  AppText(
                   dialogtitle ??'Coming Soon',
                    style: Styles.montSerratRegular(
                        context,
                        color: AppColors.whitecolor,
                        fontSize: 20),
                  ),
            
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Text(textAlign:TextAlign.center,
                                   dialogpara ??'The premium subscription will be launched soon. To get notified please enter your email below',
                      style: Styles.montSerratRegular(
                          context,
                          color: AppColors.grettext),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30),
                    child: formtextfield(
                      // height: 1.4.h,
                      fontsize: 15.sp,
                      hinttextalignment: TextAlign.center,
              
                      obscureval: false,
                      hinttext: dialoginput ??'Email',
                      customradius:
                          BorderRadius.circular(4),
                    ),
                  ),
                  Container(
                    width: 220,
                    child: button(
                      text:  dialogbuttontext??'Let me know',
                      color: AppColors.yellowcolor,
                      function: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
