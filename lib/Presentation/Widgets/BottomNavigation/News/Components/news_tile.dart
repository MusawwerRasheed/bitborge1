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

class NewsTile extends StatefulWidget {
  final String? tag;
  const NewsTile({super.key, this.tag});

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      child: Card(
        color: AppColors.secondarycolor,
        child: GestureDetector(
          onTap: () {
            Navigate.to(context, NewsTileDetails(title: widget.tag,));
          },
          child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 70.w,
                            decoration: BoxDecoration(
                              color: AppColors.darkgrey,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Center(
                              child: Text(
                                widget.tag!,
                                style: TextStyle(
                                  fontFamily:
                                      'Montserrat', // You can replace this with your desired font
                                  fontWeight: FontWeight
                                      .normal, // You can set the desired font weight
                                  fontSize:
                                      16.0, // You can set the desired font size
                                  color: _getTextColor(widget
                                      .tag!), // Call a function to get the text color based on widget.tag
                                ),
                              ),
                            )),
                        Text('20 July, 2021 | 07:30 am',
                            style: Styles.montSerratRegular(context,
                                color: AppColors.grettext, fontSize: 12)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        Strings.bitcointext,
                        style: Styles.mostserratBold(context,
                            color: AppColors.whitecolor, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),

              //  Text(Strings.bitcointext, style: Styles.mostserratBold(context, color: AppColors.whitecolor, fontSize: 12 ),
              // ),

              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  'The best Bitcoin casinos offer almost instant withdrawals, zero transaction fees, anonymous transfers, as well',
                  style: Styles.montSerratRegular(
                    context,
                    color: AppColors.grettext,
                  ),
                ),
              ),
              leading: Image.asset(
                Assets.tileimage,
              )),
        ),
      ),
    );
  }

  Color _getTextColor(String tag) {
    switch (tag) {
      case 'Positive':
        return Colors.green;
      case 'Negative':
        return Colors.red;
      case 'Neutral':
        return Colors.indigo;
      default:
        return Colors
            .black; // Default color if tag doesn't match any of the above
    }
  }
}
