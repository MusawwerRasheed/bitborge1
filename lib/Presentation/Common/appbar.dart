import 'package:bitborge/Application/NavigationServices/Navigation.dart';
import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Presentation/Widgets/Auth/login_screen.dart';
import 'package:bitborge/Presentation/Widgets/Notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final SvgPicture? mainpic;
  final SvgPicture? leading;
  final String? texttitle;
  final bool? shownotificationicon;
  final Function? leadingfunction;

  final bool? autoimply;

  CustomAppBar({
    this.autoimply = true,
    this.shownotificationicon,
    this.leadingfunction,
    this.leading,
    this.texttitle,
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
      // automaticallyImplyLeading: widget.autoimply!,
      leading: Padding(
        padding: const EdgeInsets.all(18.0),
        child: GestureDetector(
            onTap: () {
             widget.leadingfunction!();
            },
            child: widget.leading),
      ),
      elevation: 0.1,
      backgroundColor: AppColors.primarycolor,
      // automaticallyImplyLeading: false,
      centerTitle: true,
      title: (widget.mainpic == null
          ? Text(
              widget.texttitle!,
              style: TextStyle(color: Colors.white),
            )
          : widget.mainpic),

      actions: [
        widget.shownotificationicon == true
            ? GestureDetector(
                onTap: () {
                  Navigate.to(context, NotificationScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: SvgPicture.asset(Assets.notificon),
                ))
            : SizedBox(),
  
      ],
   
   
   
    );
  
  }
}
