import 'package:bitborge/Application/NavigationServices/Navigation.dart';
import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/strings.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Common/appbar.dart';
import 'package:bitborge/Presentation/Widgets/Auth/Components/form_label.dart';
import 'package:bitborge/Presentation/Widgets/Auth/create_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RiskWarning extends StatefulWidget {
  const RiskWarning({super.key});

  @override
  State<RiskWarning> createState() => _RiskWarningState();
}

class _RiskWarningState extends State<RiskWarning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      appBar: CustomAppBar(
               ),
      body: Container(
        height: 700,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: GestureDetector(
                onTap: () {
                  Navigate.to(context, CreateAccount());
                },
                child: Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset(Assets.crosscircle)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: formlabel(
                align: Alignment.topLeft,
                text: Strings.riskwarning,
                color: AppColors.whitecolor,
                fontSize: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:30, vertical: 60.0),
              child: Column(children: [

                
              Text(  style: TextStyle(color: Colors.white, fontFamily: 'Montserrat Regular'), 
                'The sun is a huge ball of gases. It has a diameter of 1,392,000 km. It is so huge that it can hold millions of planets inside it. The Sun is mainly made up of hydrogen and helium gas. The surface of the Sun is known as the photosphere. The photosphere is surrounded by a thin layer of gas known as the chromospheres. Without the Sun, there would be no life on Earth. There would be no plants, no animals and no human beings. As, all the living things on Earth get their energy from the Sun for their survival.   '),    
                
SizedBox(height: 4,),
                
              Text(  style: TextStyle(color: Colors.white, fontFamily: 'Montserrat Regular'), 
                'The sun is a huge ball of gases. It has a diameter of 1,392,000 km. It is so huge that it can hold millions of planets inside it. The Sun is mainly made up of hydrogen and helium gas. The surface of the Sun is known as the photosphere. The photosphere is surrounded by a thin layer of gas known as the chromospheres. Without the Sun, there would be no life on Earth. There would be no plants, no animals and no human beings. As, all the living things on Earth get their energy from the Sun for their survival.   '),    
                

                
          

              ],),
              
                          
            ),
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: AppColors.secondarycolor),
      ),
    );
  }
}
