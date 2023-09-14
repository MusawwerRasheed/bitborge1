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
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Profile extends StatefulWidget {
  final scaffoldKey;
  // Change 'var' to 'final'

  Profile(
      {super.key,
      required this.scaffoldKey}); // Change 'scaffoldkey' to 'scaffoldKey'

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      appBar: CustomAppBar(
        leadingfunction: () {
          print(widget.scaffoldKey);
          widget.scaffoldKey.currentState!.openDrawer();
          // Access 'scaffoldKey' using 'widget.'
        },
        shownotificationicon: true,
        texttitle: 'Profile',
        leading: SvgPicture.asset(Assets.dropdown),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.userpng),
              // GestureDetector(
              //     onTap: Navigator.of(context).pop,
              //     child: SvgPicture.asset(Assets.crosscircle),
              //     ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          AppText(
            'Muzammil Afridi',
            style: Styles.mostserratBold(context, color: AppColors.whitecolor),
          ),
          const SizedBox(
            height: 5,
          ),
          AppText(
            'mfkhan8484@gmail.com',
            style:
                Styles.montSerratRegular(context, color: AppColors.whitecolor),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Container(
              width: 150,
              height: 30,
              decoration: BoxDecoration(
                  color: AppColors.darkgrey,
                  borderRadius: BorderRadius.circular(03)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: SvgPicture.asset(Assets.diamond),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Premium User',
                    style: Styles.mostserratBold(context,
                        color: AppColors.yellowcolor, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 300,
            height: 1,
            decoration: BoxDecoration(color: AppColors.grettext),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:02, horizontal: 30),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const formlabel(
                  align: Alignment.topLeft,
                  text: 'Full Name',
                  fontSize: 18,
                ),
                const SizedBox(height: 10),
                formtextfield(
                  hinttext: 'Muzammil Afridi',
                  obscureval: false,
                  icon: SvgPicture.asset(Assets.user),
                ),
                const SizedBox(
                  height: 10,
                ),
                
                const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      formlabel(
                        align: Alignment.topLeft,
                        text: 'Country',
                        fontSize: 18,
                      ),
                      formlabel(
                        align: Alignment.topRight,
                        text: '(Optional)',
                        fontSize: 16,
                        color: Color.fromARGB(255, 112, 102, 102),
                      ),
                    ]),
                const SizedBox(height: 10),
                 
                formtextfield(
                  hinttext: 'Country',
                  obscureval: true,
               
                  icon: SvgPicture.asset(Assets.globe),
                ),
                const SizedBox(
                  height: 50,
                ),


                // button(text: 'Save Changes', color: AppColors.yellowcolor, )
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: AppColors.yellowcolor, textStyle: TextStyle(fontSize: 15),
                padding: EdgeInsets.symmetric(vertical: 012, horizontal: 100)),
                  onPressed: ( ){}, child:SizedBox( width: 100, 
                    child: Text('Save Changes'))), 
              
    Container(decoration: BoxDecoration(border: Border.all( color: AppColors.yellowcolor) , borderRadius: BorderRadius.circular(5)),
      child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: AppColors.primarycolor, 
      textStyle: TextStyle(fontSize: 15),
                  padding: EdgeInsets.symmetric(vertical: 012, horizontal: 100)),
                    onPressed: ( ){}, child:SizedBox( width: 100, 
                      child: Text('Save Changes'))),
    ), 
              
   


              ],

            ),
          ),
        ],
      ),
    );
  }
}
