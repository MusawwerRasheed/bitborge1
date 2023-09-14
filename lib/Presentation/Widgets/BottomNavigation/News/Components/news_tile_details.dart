import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Common/appbar.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/Components/custom_drawer.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/News/Components/news_tile.dart';
import 'package:bitborge/Presentation/Widgets/Notification/Components/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import 'package:flutter_svg/svg.dart';

class NewsTileDetails extends StatelessWidget {
  String? title;
  var scaffoldkey;
  NewsTileDetails({super.key, this.title, this.scaffoldkey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(Assets.newsheader), // Your original image
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 0.5, sigmaY: 0.5, tileMode: TileMode.mirror),
                    child: Container(
                      height: 1210,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent, // Make the top part transparent
                            Color.fromARGB(122, 48, 150,
                                233), // Your desired color at the bottom
                          ],
                          stops: [0.6, 1.0], // Adjust the stop values as needed
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0, // Adjust the position as needed
                left: 0,
                right: 0,
                child: Container(
                  height: 250, // Set the height of your blue container
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        AppColors.primarycolor, // Fully dark at the bottom
                        Color(0x00000000), // Fully transparent at the top
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 40, // Adjust the position as needed
                left: 10,
                right: 0,
                child: Row(
                  children: [
                    Container(
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: AppColors.whitecolor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Center(
                          child: Text(
                        title!,
                        style: Styles.montSerratRegular(
                          context,
                          fontSize: 19,
                          color:
                              //  Colors.red,
                              _pickColor(title!),
                        ),
                      )),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    AppText(
                      '20, July, 2021',
                      style: Styles.montSerratRegular(context,
                          color: Colors.grey, fontSize: 17),
                    ),
                    const SizedBox(
                      width: 60.2,
                    ),
                    SvgPicture.asset(Assets.share),
                    SizedBox(
                      width: 5.w,
                    ),
                    AppText(
                      'Share',
                      style: Styles.mostserratBold(context,
                          fontSize: 19.w, color: AppColors.yellowcolor),
                    )
                  ],
                ),
              ),
              Positioned(
                  bottom: 0.1,
                  left: 15,
                  right: 10,
                  child: Text(
                    "Bitcoins's Upgrade for the Ages' Taproot is not here",
                    style: Styles.mostserratBold(context,
                        color: AppColors.whitecolor, fontSize: 17),
                  )),
            ],
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'The best bitcon casinos expected version of the flutter, widgets are being used over all the app, there fore it creates a true , and the track of the tree is managed using the context. ',
                    style: Styles.montSerratRegular(context,
                        color: AppColors.grettext, fontSize: 15),
                  ),
                  Text(
                    'The best bitcon casinos expected version of the flutter, widgets are being used over all the app, there fore it creates a true , and the track of the tree is managed using the context. ',
                    style: Styles.montSerratRegular(context,
                        color: AppColors.grettext, fontSize: 15),
                  ),
                  Text(
                    'The best bitcon casinos expected version of the flutter, widgets are being used over all the app, there fore it creates a true , and the track of the tree is managed using the context. ',
                    style: Styles.montSerratRegular(context,
                        color: AppColors.grettext, fontSize: 15),
                  ),
                  Text(
                    'The best bitcon casinos expected version of the flutter, widgets are being used over all the app, there fore it creates a true , and the track of the tree is managed using the context. ',
                    style: Styles.montSerratRegular(context,
                        color: AppColors.grettext, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ],
      )

      // key: scaffoldkey1,
      ,
      backgroundColor: AppColors.primarycolor,
      appBar: CustomAppBar(
        leading: SvgPicture.asset(Assets.dropdown),
        shownotificationicon: true,
        leadingfunction: () {
          // print('News screen scaffold key is $scaffoldkey');
          scaffoldkey.currentState!.openDrawer();
        },
        texttitle: 'News',
      ),
    );
  }

  _pickColor(String val) {
    switch (val) {
      case 'Positive':
        return Colors.green;
      case 'Negative':
        return Colors.red;
      case 'Neutral':
        return Colors.indigo;
    }
  }
}
