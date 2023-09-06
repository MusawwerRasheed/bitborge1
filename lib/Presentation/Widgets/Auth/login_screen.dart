import 'package:bitborge/Application/NavigationServices/Navigation.dart';
import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/strings.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Common/appbar.dart';
import 'package:bitborge/Presentation/Common/button.dart';
import 'package:bitborge/Presentation/Widgets/Auth/Components/form_label.dart';
import 'package:bitborge/Presentation/Widgets/Auth/Components/form_text_field.dart';
import 'package:bitborge/Presentation/Widgets/Auth/create_account_screen.dart';
import 'package:bitborge/Presentation/Widgets/Auth/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
 
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
 
class _LoginScreenState extends State<LoginScreen> {
  String? emailcontroller;
  String? passwordcontroller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      appBar: CustomAppBar(mainpic: SvgPicture.asset(Assets.logomajor),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const formlabel(
                align: Alignment.topLeft,
                text: Strings.login,
                color: AppColors.whitecolor,
                fontSize: 25,
              ),
              const SizedBox(
                height: 10,
              ),
              const formlabel(
                align: Alignment.topLeft,
                text: Strings.pleaseenter,
                color: AppColors.grettext,
                fontSize: 15,
              ),
              const SizedBox(
                height: 20,
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
              GestureDetector( onTap: (){ 
                Navigate.to(context, OTPScreen( ));
              },
                child: formlabel(
                  align: Alignment.topRight,
                  text: 'Forgot Password?',
                  color: AppColors.yellowcolor,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  button(text: 'Login', color: AppColors.yellowcolor,),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                AppText(
                  Strings.donthaveaccount,
                  style: Styles.montSerratRegular(context,
                      fontSize: 18, color: AppColors.whitecolor),
                ),
                GestureDetector(
                    onTap: () {
                      Navigate.to(context, CreateAccount());
                    },
                    child: AppText(
                      Strings.createaccount,
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
