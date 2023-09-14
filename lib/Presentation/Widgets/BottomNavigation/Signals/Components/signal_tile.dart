import 'package:bitborge/Application/NavigationServices/Navigation.dart';
import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/strings.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/Signals/Components/signal_tile_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignalsTile extends StatefulWidget {
  const SignalsTile({super.key});

  @override
  State<SignalsTile> createState() => _SignalsTileState();
}
class _SignalsTileState extends State<SignalsTile> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      child: GestureDetector(onTap: () {
        Navigate.to(context,SignalTileDetails());
      },
        child: Card(
          color: AppColors.secondarycolor,
          child:  Row(
            children: [
              //column 1
              Column(
                children: [
                  SizedBox(height: 10,), 
                  Row(children: [
                  
                  SvgPicture.asset(Assets.btc), 
                   SvgPicture.asset(Assets.tether), 
                   SizedBox(height: 10,),
      
      
                ],),
                SizedBox(height: 1,),
                
                   SvgPicture.asset(Assets.btcstd),
                  SvgPicture.asset(Assets.buylong),
      
                  SizedBox(height: 20,), 
                    
                Padding(
                  padding: const EdgeInsets.only(left:18.0),
                  child: Row(
                    children:[ AppText('Current Price', style: Styles.montSerratRegular(context, fontSize: 10, color: AppColors.whitecolor),
                    
                     ),
                 SizedBox(width: 3,),
                AppText('+21.2%', style: Styles.montSerratRegular(context, fontSize: 10, color: AppColors.greencolor),
                    
                    
                     ),
              
                     ]
                  ),
                  
                ), 
                 
      
        SizedBox(height: 20,)
                ],
                
              ),
      
              // column 2
              SizedBox(width: 20,), 
      
              Column(
      
                children: [
                
       
      
      
                  SvgPicture.asset(Assets.bars),
      
                  AppText('Stats', style: Styles.mostserratBold(context, color: AppColors.whitecolor, 
                  fontSize: 8
                  ),), 
      
                  SizedBox(height: 5,), 
                  AppText('Binance', style: Styles.montSerratRegular(context, color: AppColors.whitecolor, fontSize: 8),),
                
                  SizedBox(height: 7,),
                Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), 
                color: AppColors.secondarycolor, border: Border.all(color: AppColors.whitecolor, width: 1), 
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:2, horizontal: 15.0),
                  child: Text('Hold', style: Styles.mostserratBold(context,
                   color: AppColors.whitecolor, fontSize: 15),),
                ),
                ), 
       SizedBox(height: 40,), 
                ],
              ), 
      
              // column3
              SizedBox(width: 40,),
      
              Column(
      children: [
      
        AppText('Spot', style: Styles.mostserratBold(context, color: AppColors.whitecolor
        , 
        ),),
      
        SizedBox(height: 5,),
       Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), 
                color: AppColors.secondarycolor, border: Border.all(color: Color.fromARGB(255, 105, 250, 61), width: 1), 
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:5, horizontal: 5.0),
                  child: Text('Low Risk', style: Styles.montSerratRegular(context,
                   color: Color.fromARGB(255, 105, 250, 61), fontSize: 10),),
                ),
                ), 
      SizedBox(height: 5,),
       Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), 
                color: Color.fromARGB(255, 105, 255, 91), border: Border.all(color: Color.fromARGB(255, 105, 250, 61), width: 1), 
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:5, horizontal: 5.0),
                  child: Text('@ Target', style: Styles.mostserratBold(context,
                   color: Color.fromARGB(255, 255, 255, 255), fontSize: 15),),
                ),
                ), 
      
      SizedBox(height: 08,),
      AppText('10:20 Pm 23/06/2021' , style: Styles.mostserratBold(context, fontSize: 08, color: Colors.grey),),
      SizedBox(height: 20,),
      ],
      
              ), 
      
      
            ],
          ),
        ),
      ),
    );
  }
}
