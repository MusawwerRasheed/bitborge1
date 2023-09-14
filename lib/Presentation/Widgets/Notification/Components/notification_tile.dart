

import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/strings.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationTile extends StatefulWidget {
  const NotificationTile({super.key});

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:3, horizontal: 5),
      child: Card(
        
        color: AppColors.secondarycolor,
      child: ListTile(  
      title: Column( children: [ 

        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('20 July, 2021 | 07:30 am', style: Styles.montSerratRegular(context, color: AppColors.grettext, fontSize: 9),
        ), 

        Container(width: 10, height: 10,
          decoration: BoxDecoration( color: AppColors.yellowcolor,  borderRadius: BorderRadius.circular(90) ),)
     
        ],)  ,
      
      
      Text(Strings.bitcointext, style: Styles.mostserratBold(context, color: AppColors.whitecolor, fontSize: 12),
      ), 

       ],) ,
      
      //  Text(Strings.bitcointext, style: Styles.mostserratBold(context, color: AppColors.whitecolor, fontSize: 12 ),
      // ),
    subtitle:  AppText(Strings.clicktoread,  style: Styles.montSerratRegular(context, color: AppColors.yellowcolor, ), ),
    
      leading: Container(child: Image.asset( Assets.tileimage,))),
      ),
    );  
  }
}








 
