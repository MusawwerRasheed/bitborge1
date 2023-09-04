import 'package:bitborge/Application/NavigationServices/Navigation.dart';
import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Common/appbar.dart';
import 'package:bitborge/Presentation/Widgets/Intro/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({
    key,
  })  : preferredSize = const Size.fromHeight(65),
        super(key: key) {
    // TODO: implement CustomAppBar
  }

  @override
  final Size preferredSize;

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.1,
      backgroundColor: AppColors.primarycolor,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: SvgPicture.asset(Assets.logomajor),
     
       



    );

   }



}
