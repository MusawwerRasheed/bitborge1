import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Common/appbar.dart';
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
    ScreenUtil.init(context, designSize: Size(360, 640), );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(Assets.newsheader),  
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 0.5,
                        sigmaY: 0.5,
                        tileMode: TileMode.mirror,
                      ),
                      child: Container(
                        height: 1210.h,  
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,  
                              Color.fromARGB(122, 48, 150, 233),  
                            ],
                            stops: [0.6, 1.0],  
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
                    height: 250.h,  
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
                  bottom: 45.h,  
                  left: 10.w,  
                  right: 0,
                  child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 90.w,
                        decoration: BoxDecoration(
                          color: AppColors.whitecolor,
                          borderRadius: BorderRadius.circular(3.w),   
                        ),
                        child: Center(
                          child: Text(textScaleFactor: 1.0,
                            title!,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 19.sp,  
                              color: pickColor(title!),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      AppText(
                        '20, July, 2021',
                        style: Styles.montSerratRegular(context,
                            color: Colors.grey, fontSize: 17.sp), 
                      ),
                       SizedBox(
                        width: 30.2.w,  
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
                  bottom: 0.1.h,  
                  left: 15.w,  
                  right: 10.w,  
                  child: Text(textScaleFactor: 1.0,
                    "Bitcoins's Upgrade for the Ages' Taproot is not here",
                    style: Styles.mostserratBold(context,
                        color: AppColors.whitecolor, fontSize: 17.sp),  
                  ),
                ),
              ],
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(24.w),  
                child: Column(
                  children: [
                    Text( textScaleFactor: 1.0, textAlign:TextAlign.center,
                      'The best bitcon casinos expected version of the flutter, widgets are being used over all the app, there fore it creates a true , and the track of the tree is managed using the ',
                      style:  Styles.montSerratRegular(context, 
                          color: AppColors.grettext, fontSize: 15.sp), 
                    ),
                    Text(textScaleFactor: 1.0, textAlign:TextAlign.center,
                      'The best bitcon casinos expected version of the flutter, widgets are being used over all the app, there fore it creates a true , and the track of the tree is managed using . ',
                      style: Styles.montSerratRegular(context,
                          color: AppColors.grettext, fontSize: 15.sp),  
                    ),
                    Text(textScaleFactor: 1.0, textAlign:TextAlign.center,
                      'The best bitcon casinos expected version of the flutter, widgets are being used over all the app, there fore it creates a true , and the track of the tree is managed using the. ',
                      style: Styles.montSerratRegular(context,
                          color: AppColors.grettext, fontSize: 15.sp),  
                    ), 
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.primarycolor,
      appBar: CustomAppBar(
        leading: SvgPicture.asset(Assets.leftarrow),
        shownotificationicon: true,
        leadingfunction: () {
          Navigator.pop(context); 
        },
        texttitle: 'News',
      ),
    );
  }

  pickColor(String val) {
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
