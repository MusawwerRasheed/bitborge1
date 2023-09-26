import 'package:bitborge/Application/NavigationServices/Navigation.dart';
import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/strings.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/News/Components/news_tile_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsTile extends StatefulWidget {
  final String? tag;
  const NewsTile({super.key, this.tag});

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  @override
  Widget build(BuildContext context) {
    // Initialize flutter_screenutil for responsive design
    ScreenUtil.init(context, designSize: Size(360, 640), );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w), // Use responsive padding
      child: Card(
        color: AppColors.secondarycolor,
        child: GestureDetector(
          onTap: () {
            Navigate.to(context, NewsTileDetails(title: widget.tag));
          },
          child: ListTile(
            title: Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 70.w, // Use responsive width
                        decoration: BoxDecoration(
                          color: AppColors.darkgrey,
                          borderRadius: BorderRadius.circular(3.w), // Use responsive border radius
                        ),
                        child: Center(
                          child: Text(textScaleFactor: 1.0,
                            widget.tag!,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.normal,
                              fontSize: 16.sp, // Use responsive font size
                              color: getTextColor(widget.tag!),
                            ),
                          ),
                        ),
                      ),
                      Text(textScaleFactor: 1.0,
                        '20 July, 2021 | 07:30 am',
                        style: Styles.montSerratRegular(context,
                            color: AppColors.grettext, fontSize: 12.sp), // Use responsive font size
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.h), // Use responsive padding
                    child: Text(textScaleFactor: 1.0,
                      Strings.bitcointext,
                      style: Styles.mostserratBold(context,
                          color: AppColors.whitecolor, fontSize: 12.sp), // Use responsive font size
                    ),
                  ),
                ],
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 5.h), // Use responsive padding
              child: Text(textScaleFactor: 1.0,
                'The best Bitcoin casinos offer almost instant withdrawals, zero transaction fees, anonymous transfers, as well',
                style: Styles.montSerratRegular(
                  context,
                  color: AppColors.grettext,
                ),
              ),
            ),
            leading: Image.asset(
              Assets.tileimage,
            ),
          ),
        ),
      ),
    );
  }

  Color getTextColor(String tag) {
    switch (tag) {
      case 'Positive':
        return Colors.green;
      case 'Negative':
        return Colors.red;
      case 'Neutral':
        return Colors.indigo;
      default:
        return Colors.black; // Default color if tag doesn't match any of the above
    }
  }
}
