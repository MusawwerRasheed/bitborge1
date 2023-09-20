 
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 
extension Scale on BuildContext {

  double get textScale => MediaQuery.of(this).textScaleFactor;
}

class Styles {
  
  static double _textScale(
    BuildContext context,
  ) {
     //print(MediaQuery.of(context).textScaleFactor);
    return MediaQuery.of(context).textScaleFactor > 1.0
        ? 0.9
        : MediaQuery.of(context).textScaleFactor;
  }

   

  static TextStyle mostserratBold(BuildContext context,
      {double? fontSize, Color? color,FontWeight? fontWeight, TextAlign? textalign, }) {
    return TextStyle(
      // fontSize: (fontSize ?? 14.0.sp) * _textScale(context),
      fontSize: fontSize,
      color: color ?? AppColors.whitecolor,
      fontFamily: "Montserrat Bold",
      fontWeight: fontWeight?? FontWeight.normal,
       
    );
  }




  static TextStyle montSerratRegular(BuildContext context,
      {double? fontSize, Decoration? decoration,   Color? color, double height = 1.4,FontWeight fontWeight = FontWeight.normal}) {
    return TextStyle(
      // fontSize: (fontSize ?? 14.0.sp) * _textScale(context),
      color: color ?? AppColors.whitecolor,
      fontSize: fontSize,

      fontFamily: "Montserrat Regular",
      height: height,
      fontWeight: fontWeight
    );
  }
 }
