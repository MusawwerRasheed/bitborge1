import 'package:bitborge/Application/NavigationServices/Navigation.dart';
import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/strings.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/Components/profile.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/Components/subscriptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


 class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.primarycolor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.primarycolor,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigate.to(context, Profile(  ));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(Assets.userpng),
                        GestureDetector(
                            onTap: Navigator.of(context).pop,
                            child: SvgPicture.asset(Assets.crosscircle)),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    AppText(
                      'Muzammil Afridi',
                      style: Styles.mostserratBold(context, color: AppColors.whitecolor, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    AppText(
                      'mfkhan8484@gmail.com',
                      style: Styles.montSerratRegular(context, color: AppColors.whitecolor, fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Container(
                        width: 170.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            color: AppColors.darkgrey,
                            borderRadius: BorderRadius.circular(3.w)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 1.w),
                              child: SvgPicture.asset(Assets.diamond),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(textScaleFactor: 1.0,
                              'Premium User',
                              style: Styles.mostserratBold(context, color: AppColors.yellowcolor, fontSize: 16.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(Assets.homewhite),
              title: AppText(
                Strings.home,
                style: Styles.mostserratBold(context, color: AppColors.whitecolor, fontSize: 16.sp),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: SvgPicture.asset(Assets.contactuswhite),
              title: AppText(
                Strings.contactus,
                style: Styles.mostserratBold(
                  context,
                  color: AppColors.whitecolor,
                  fontSize: 16.sp,
                ),
              ),
              onTap: () {
                // Handle item 2 tap here
              },
            ),

            ListTile(
              leading: SvgPicture.asset(Assets.settingswhite),
              title: AppText(
                Strings.settings,
                style: Styles.mostserratBold(
                  context,
                  color: AppColors.whitecolor,
                  fontSize: 16.sp,
                ),
              ),
              onTap: () {
                // Handle item 2 tap here
              },
            ),

            ListTile(
              leading: SvgPicture.asset(Assets.logoutwhite),
              title: AppText(
                Strings.logout,
                style: Styles.mostserratBold(
                  context,
                  color: AppColors.whitecolor,
                  fontSize: 16.sp,
                ),
              ),
              onTap: () {
                // Handle item 2 tap here
              },
            ),
            // Add more ListTile items as needed
            SizedBox(
              height: 80.h,
            ),

            Center(
              child: Container(
                width: 150.w,
                height: 30.h,
                decoration: BoxDecoration(
                    color: AppColors.yellowcolor,
                    borderRadius: BorderRadius.circular(3.w)),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child: SvgPicture.asset(Assets.diamondgrey),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                      onTap: () => Navigate.to(context, Subscriptions()),
                      child: Text(textScaleFactor: 1.0,
                        'Upgrade plan',
                        style: Styles.mostserratBold(context, color: AppColors.primarycolor, fontSize: 16.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
