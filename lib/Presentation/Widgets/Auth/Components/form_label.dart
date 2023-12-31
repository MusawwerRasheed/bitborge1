import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/strings.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:flutter/material.dart';
 

class formlabel extends StatelessWidget {
 final Color? color; 
 final double? fontSize;
 final String? text;
 final FontWeight? fontWeight;
 final AlignmentGeometry align;
 

  const formlabel({
    super.key, this.color, this.fontSize, this.fontWeight, this.text, required this.align,  
  });


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:  align,
      child: AppText(
        text!,
        style: Styles.montSerratRegular(context,
            color: color,
            fontSize: fontSize,
            // fontWeight: fontWeight, 
             
           ),
      ),
    );
  }
}
