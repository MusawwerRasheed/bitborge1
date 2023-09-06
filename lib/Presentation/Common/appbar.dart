import 'package:bitborge/Application/NavigationServices/Navigation.dart';
import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Common/appbar.dart';
import 'package:bitborge/Presentation/Widgets/Auth/login_screen.dart';
import 'package:bitborge/Presentation/Widgets/Intro/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
 final SvgPicture? mainpic ;
 final SvgPicture? leading;
  CustomAppBar({
    this.leading, 
   this.mainpic,
    key,
  })  : preferredSize = const Size.fromHeight(65),
        super(key: key) {}

  @override
  final Size preferredSize;

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(onTap: (){ Navigate.to(context, LoginScreen());} , child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: widget.leading,
      )),
      
     
      elevation: 0.1,
      backgroundColor: AppColors.primarycolor,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: widget.mainpic,
    );
  }
}
