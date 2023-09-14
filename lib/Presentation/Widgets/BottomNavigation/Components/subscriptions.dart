import 'package:bitborge/Application/NavigationServices/Navigation.dart';
import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/strings.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Common/appbar.dart';
import 'package:bitborge/Presentation/Common/button.dart';
import 'package:bitborge/Presentation/Common/check_box.dart';
import 'package:bitborge/Presentation/Widgets/Auth/Components/form_label.dart';
import 'package:bitborge/Presentation/Widgets/Auth/Components/form_text_field.dart';
import 'package:bitborge/Presentation/Widgets/Auth/login_screen.dart';
import 'package:bitborge/Presentation/Widgets/Auth/risk_warning.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/Components/subscription_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Subscriptions extends StatefulWidget {
  // final scaffoldKey;
  // Change 'var' to 'final'



  Subscriptions(
      {super.key,
      // required this.scaffoldKey
      }); // Change 'scaffoldkey' to 'scaffoldKey'

  @override
  State<Subscriptions> createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      appBar: CustomAppBar(
      leadingfunction: ()=> Navigator.pop(context),
        shownotificationicon: true,
        texttitle: 'Subscriptions',
        leading: SvgPicture.asset(Assets.leftarrow),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
               
               Align(
                
                 alignment: Alignment.topCenter,
                child: 
                Column(children: [
                  Image.asset(Assets.subscriptionicon),
                const SizedBox(height: 10,), 
                  AppText('Unlock premium Features', style: Styles.mostserratBold(context, color: AppColors.yellowcolor, 
                  fontSize: 16),), 

                  Padding(
                    padding: const EdgeInsets.only(left:15 , right: 15, top: 10),
                    child: Text(textAlign: TextAlign.center, 'You can buy any premium subciption and enjoy Umlimited features of the app.' ,  
                    style:   Styles.montSerratRegular(context, color: AppColors.grettext , fontSize: 15),
                    ),
                  )

                ],),
                
                ), 


              const SizedBox(height: 15,),
              const subsctiotioncontainer(text1: 'Yearly plan', text2: '\$300 / Month',),         
              const SizedBox(height: 10,),         
                 const subsctiotioncontainer(text1: '6 Months plan', text2: '\$300 / Month',), 
                 const SizedBox(height: 10,),                 
     const subsctiotioncontainer(text1: '3 Months plan', text2: '\$300 / Month',),                 
               
               
   
   


              ],

            ),
          );
  }
}

