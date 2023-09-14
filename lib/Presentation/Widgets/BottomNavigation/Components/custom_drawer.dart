import 'package:bitborge/Application/NavigationServices/Navigation.dart';
import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/strings.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/Components/profile.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/Components/subscriptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    // required this.context,
  });

  // final BuildContext context;

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
              child: GestureDetector( onTap: (){
                 Navigate.to(context, Profile(scaffoldKey: 'LabeledGlobalKey<ScaffoldState>#1ed5c'));
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
                    const SizedBox(
                      height: 5,
                    ),
                    AppText(
                      'Muzammil Afridi',
                      style: Styles.mostserratBold(context,
                          color: AppColors.whitecolor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    AppText(
                      'mfkhan8484@gmail.com',
                      style: Styles.montSerratRegular(context,
                          color: AppColors.whitecolor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Container(
                        width: 170,
                        height: 30,
                        decoration: BoxDecoration(
                            color: AppColors.darkgrey,
                            borderRadius: BorderRadius.circular(03)),
                        child: Row( mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 1.0),
                              child: SvgPicture.asset(Assets.diamond),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Premium User',
                              style: Styles.mostserratBold(context,
                                  color: AppColors.yellowcolor, fontSize: 16),
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
                style:
                    Styles.mostserratBold(context, color: AppColors.whitecolor),
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
                ),
              ),
              onTap: () {
                // Handle item 2 tap here
              },
            ),
            // Add more ListTile items as needed
            SizedBox(
              height: 80,
            ),

            Center(
              child: Container(
                width: 150,
                height: 30,
                decoration: BoxDecoration(
                    color: AppColors.yellowcolor,
                    borderRadius: BorderRadius.circular(03)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: SvgPicture.asset(Assets.diamondgrey),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () => Navigate.to(context, Subscriptions())
                      ,
                      child: Text(
                        'Upgrade plan',
                        style: Styles.mostserratBold(context,
                            color: AppColors.primarycolor, fontSize: 16),
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
