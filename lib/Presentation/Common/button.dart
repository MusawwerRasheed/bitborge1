import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/strings.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class button extends StatelessWidget {
  final Styles? style; 
  final Color? color ; 
  final VoidCallback? function;
  final String text;
  

  const button({
    
    this.style, 
    this.color, 
    this.function,
    required this.text,
    super.key,

  });


  @override

  Widget build(BuildContext context) {
    return SizedBox(height: 37.h, 
      child: ElevatedButton(
        style: ElevatedButton.styleFrom( 
        backgroundColor:color ??AppColors.yellowcolor ,  ),
       onPressed: function, 
      child: AppText(text, 
      style: Styles.montSerratRegular(context, 
      color: AppColors.whitecolor,fontSize: 18.sp),)),
    );
  }

}