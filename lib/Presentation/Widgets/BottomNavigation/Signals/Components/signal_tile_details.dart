import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Common/appbar.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/Signals/Components/signal_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';




 class SignalTileDetails extends StatefulWidget {

  SignalTileDetails({super.key, 
  // this.scaffoldKey
  }); 

  @override
  State<SignalTileDetails> createState() => _SignalTileDetailsState();
}

class _SignalTileDetailsState extends State<SignalTileDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      body: 
      Column(children: [
        Container(
        child: 
        SignalsTile( function: (){},), 
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Container( 
            color: AppColors.secondarycolor,
            child: Row(children: [
              SizedBox(width: 10.w,),
              Column(children: [SvgPicture.asset(Assets.check)],), 
              SizedBox(width: 20.w,),  
              Column( children: [ 
                SizedBox(height: 10.h ,),
                AppText('Target 1' , style: Styles.montSerratRegular(context, color: 
              Colors.grey, fontSize: 12, 
              )) , 
               SizedBox(height: 10.h,),
              Padding(
                padding: const EdgeInsets.only(bottom:20.0),
                child: AppText('Leverage 12', style: Styles.montSerratRegular(context, 
                color: Colors.lightGreen, fontSize: 11),),
              )],),
               SizedBox(width: 110.w ,),       
              Column( children: [ 
                 SizedBox(height: 10.h ,),
                AppText('\$1200' , style: Styles.mostserratBold(context, color: 
              const Color.fromARGB(255, 62, 255, 69), fontSize: 14, 
              )) , 
               SizedBox(height: 10.h ,),
              Padding(
                padding: const EdgeInsets.only(bottom:20.0),
                child: AppText('Stop lost 1.93', style: Styles.mostserratBold(context, 
                color: const Color.fromARGB(255, 255, 19, 19), fontSize: 14),),
              )],),
             ],),
          ),
        ),
      )  
      ],), 
      
      backgroundColor: AppColors.primarycolor,
      appBar: CustomAppBar( 
        leadingfunction: () {
             Navigator.pop(context); 
          // widget.scaffoldKey.currentState!.openDrawer(); // Access 'scaffoldKey' using 'widget.'
        },
        shownotificationicon: true, 
        texttitle: 'BTC USDT', 
        leading: SvgPicture.asset(Assets.leftarrow),
      ),
    );
  }
}
