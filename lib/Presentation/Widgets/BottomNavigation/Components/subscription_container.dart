 
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:flutter/material.dart';

class subsctiotioncontainer extends StatelessWidget {
   final String? text1;
   final String? text2; 
  const subsctiotioncontainer({
    this.text1,
    this.text2, 
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return Container(

      width: MediaQuery.of(context).size.width*0.9, height: MediaQuery.of(context).size.height *0.1,
      decoration: BoxDecoration(
 
        color: AppColors.yellowcolor, borderRadius: BorderRadius.circular(4),
        
      ),
      
      child:  Column(
      children: [ 
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text( textScaleFactor: 1.0,   text1! , style: Styles.montSerratRegular(context, color: Colors.black, fontSize: 12),),
        ), 
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text( textScaleFactor: 1.0, text2!, style: Styles.mostserratBold(context, color: Colors.black, fontSize: 15),),
        )
      ],
    ),);
  }
}
