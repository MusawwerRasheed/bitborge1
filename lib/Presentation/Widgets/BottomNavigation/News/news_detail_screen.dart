import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Common/appbar.dart';
import 'package:bitborge/Presentation/Common/dialog.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/News/Components/news_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
 
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsScreen extends StatefulWidget {
  var scaffoldkey;
  NewsScreen({super.key, this.scaffoldkey});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}


class _NewsScreenState extends State<NewsScreen> {
  final ValueNotifier<int> selectedindex = ValueNotifier<int>(0);
  List<String> titles = ['Positive', 'Negative', 'Neutral'];
  List<String> newscats = ['All', 'Favorite Coins', 'Popular Events', 'News'];
  List<bool> isSelected = [true, false, false, false]; // Track selected items


  @override
  void dispose() {
    selectedindex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Initialize flutter_screenutil for responsive design
    ScreenUtil.init(context, designSize: Size(360, 640), );

    return Scaffold(
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < newscats.length; i++)
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.w, vertical: 5.h), // Use responsive padding
                    child: GestureDetector(
                      onTap: () {
                        selectedindex.value = i; // Update selected index
                        setState(() {
                          // Update the isSelected list to track selected items
                          for (int j = 0; j < isSelected.length; j++) {
                            isSelected[j] = (j == i);
                          }
                        });
                      },
                      child: Column(
                        children: [
                          Text(textScaleFactor: 1.0,
                            newscats[i],
                            style: TextStyle(
                              color: isSelected[i] ? Colors.orange : Colors.white,
                              fontSize: 16.sp, // Use responsive font size
                            ),
                          ),
                          if (isSelected[i])
                            Container(
                              margin: EdgeInsets.only(top: 4.h), // Use responsive margin
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle,
                              ),
                              width: 6.w, // Use responsive width
                              height: 6.h, // Use responsive height
                            ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: selectedindex,
              builder: (BuildContext context, int value, Widget? child) {
                return Screens(
                  screencount: value,
                  titles: titles,
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.primarycolor,
      appBar: CustomAppBar(
        leading: SvgPicture.asset(Assets.dropdown),
        shownotificationicon: true,
        leadingfunction: () {
          widget.scaffoldkey.currentState!.openDrawer();
        },
        texttitle: 'News',
      ),
      
    );
  }
}

class Screens extends StatefulWidget {
  final List<String>? titles;
  final int? screencount;
  const Screens({super.key, this.titles, this.screencount});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  @override
  Widget build(BuildContext context) {
    if (widget.screencount == 0) {
      return Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 14.w),
                child: AppText(
                  '100 News found',
                  fontSize: 14.sp,
                  style: Styles.montSerratRegular(context, color: AppColors.grettext),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: widget.titles!.length,
              itemBuilder: (BuildContext context, index) {
                String title = widget.titles![index];
                return NewsTile(
                  tag: title,
                );
              },
            ),
          ),
        ],
      );
    } else if (widget.screencount == 1) {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      SvgPicture.asset(Assets.heartwhite),
                      SizedBox(width: 10.w),
                      AppText(
                        'Favorite coins',
                        fontSize: 16.sp,
                        style: Styles.montSerratRegular(context, color: AppColors.whitecolor),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return customdialog(
                          dialogbuttontext: 'Add Coin',
                          dialoginput: "Separate coin with, ',' (BTC, ETH)",
                          dialogtitle: 'Add your Favorite coins',
                          dialogpara: 'E.g BTC, ETH, BNB etc',
                          mainsvg: SvgPicture.asset(Assets.bitcoingroup),
                        );
                      },
                    );
                  },
                  child: AppText(
                    '+ Add Coin ',
                    style: Styles.montSerratRegular(context, color: AppColors.yellowcolor, fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 14.w),
                child: AppText(
                  '100 News found',
                  fontSize: 14.sp,
                  style: Styles.montSerratRegular(context, color: AppColors.grettext),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: widget.titles!.length,
              itemBuilder: (BuildContext context, index) {
                String title = widget.titles![index];
                return NewsTile(
                  tag: title,
                );
              },
            ),
          ),
        ],
      );
    } else if (widget.screencount == 2) {
      return Container(color: Colors.indigo, width: 0.9.sw, height: 200.h);
    } else {
      return Container(color: Colors.pink, width: 0.9.sw, height: 200.h);
    }
  }
}





















 




















 
 
 