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
import 'package:flutter_svg/svg.dart';


class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});
  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String? emailcontroller;
  String? passwordcontroller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
       appBar: CustomAppBar(
        mainpic: SvgPicture.asset(Assets.logomajor),
       ),
       
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: 
          
          
          Column(
            children: [
              const formlabel(
                align: Alignment.topLeft,
                text: Strings.createaccount,
                color: AppColors.whitecolor,
                fontSize: 25,
              ),
              const SizedBox(
                height: 10,
              ),
              const formlabel(
                align: Alignment.topLeft,
                text: Strings.pleaseenterbelow,
                color: AppColors.grettext,
                fontSize: 15,
              ),
              const SizedBox(
                height: 20,
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
              const formlabel(
                align: Alignment.topLeft,
                text: 'Email',
                fontSize: 18,
              ),
              const SizedBox(height: 10),
              formtextfield(
                hinttext: 'hellojohn@gmail.com',
                obscureval: false,
                icon: SvgPicture.asset(Assets.envolope),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                obscureval: false,
                icon: SvgPicture.asset(Assets.globe),
              ),
              const SizedBox(
                height: 10,
              ),
              const formlabel(
                align: Alignment.topLeft,
                text: 'Password',
                fontSize: 18,
              ),
              const SizedBox(
                height: 10,
              ),
              formtextfield(
                hinttext: '*******',
                obscureval: true,
                righticon: SvgPicture.asset(Assets.eye),
                icon: SvgPicture.asset(Assets.lock),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                const checkbox(),
                Row(
                  children: [
                    AppText(
                      Strings.doyouagree,
                      style: Styles.montSerratRegular(context,
                          fontSize: 11, color: AppColors.grettext),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigate.toReplace(context, const RiskWarning(),);
                      },
                      child: const Text(
                        'Terms and conditions',
                        style: TextStyle(
                          fontSize: 11,
                          fontFamily: "Montserrat Regular",
                          color: AppColors.grettext,
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromARGB(255, 105, 118,
                              129), // You can set the underline color if needed
                          decorationStyle: TextDecorationStyle
                              .solid, // You can adjust the underline style
                        ),
                      ),
                    ),
                  ],
                )
              ]),
              Row(children: [
                const checkbox(),
                AppText(
                  Strings.doyouacknowledge,
                  style: Styles.montSerratRegular(context,
                      fontSize: 11, color: AppColors.grettext),
                )
              ]),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  button(color: AppColors.yellowcolor,
                    text: 'Create Account',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                AppText(
                  Strings.alreadyhaveacc,
                  style: Styles.montSerratRegular(context,
                      fontSize: 18, color: AppColors.whitecolor),
                ),
                GestureDetector(
                    onTap: () {
                      Navigate.to(context, const LoginScreen());
                    },
                    child: AppText(
                      Strings.login,
                      style: Styles.montSerratRegular(context,
                          fontSize: 16, color: AppColors.yellowcolor),
                    ))
              ]),
            ],
          ),




        ),
      ),
    );
  }
}
