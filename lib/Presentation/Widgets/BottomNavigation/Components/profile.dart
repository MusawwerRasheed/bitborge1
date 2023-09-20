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
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
 class Profile extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;

  Profile({Key? key,  this.scaffoldKey});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      appBar: CustomAppBar(
        leadingfunction: () {
          Navigator.pop(context);
          // widget.scaffoldKey.currentState!.openDrawer();
        },
        shownotificationicon: true,
        texttitle: 'Profile',
        leading: SvgPicture.asset(Assets.leftarrow),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.userpng),
            ],
          ),
          SizedBox(height: 5.h),
          AppText(
            'Muzammil Afridi',
            style: Styles.mostserratBold(context, color: AppColors.whitecolor, fontSize: 16.sp),
          ),
          SizedBox(height: 5.h),
          AppText(
            'mfkhan8484@gmail.com',
            style: Styles.montSerratRegular(context, color: AppColors.whitecolor, fontSize: 14.sp),
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Container(
              width: 170.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: AppColors.darkgrey,
                borderRadius: BorderRadius.circular(3.w),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: SvgPicture.asset(Assets.diamond),
                  ),
                  SizedBox(width: 10.w),
                  Text(textScaleFactor: 1.0,
                    'Premium User',
                    style: Styles.mostserratBold(context,
                     color: AppColors.yellowcolor, fontSize: 16.sp),
                  ),

                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            width: 300.w,
            height: 1.h,
            decoration: BoxDecoration(color: AppColors.grettext),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 30.w),
            child: Column(
              children: [
                SizedBox(height: 10.h),
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
                SizedBox(height: 10.h),
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
                  obscureval: true,
                  icon: SvgPicture.asset(Assets.globe),
                ),
                
                SizedBox(height: 50.h),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.yellowcolor,
                    textStyle: TextStyle(fontSize: 15.sp),
                    padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 100.w),
                  ),
                  onPressed: () {},
                  
                    child: Text( textScaleFactor: 1.0,'Save Changes'),
                ),
                
                SizedBox(height: 4.h,),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.yellowcolor),
                    borderRadius: BorderRadius.circular(5.w),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primarycolor,
                      textStyle: TextStyle(fontSize: 15.sp),
                    ),
                     onPressed: () {},
                    child: SizedBox(
                      width: 260.w,
                      child: Text (textAlign:TextAlign.center ,'change password'),
                    ),
                  ),
                ),
     
              ],
            ),
          ),
        ],
      ),
    );
  }
}
