import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/strings.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final Color? color ; 

final String text;

  const button({
    this.color, 
    required this.text,
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(style: ElevatedButton.styleFrom(primary:color) , onPressed: (){}, 
    child: AppText(text, 
    style: Styles.montSerratRegular(context, 
    color: AppColors.whitecolor,fontSize: 18),));
  }
}