import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/strings.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Common/appbar.dart';
import 'package:bitborge/Presentation/Widgets/Auth/Components/form_label.dart';
import 'package:bitborge/Presentation/Widgets/Auth/Components/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      appBar: CustomAppBar(),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            formlabel(
              text: Strings.login,
              color: AppColors.whitecolor,
              fontSize: 25,
            ),
            SizedBox(
              height: 10,
            ),
            formlabel(
              text: Strings.pleaseenter,
              color: AppColors.grettext,
              fontSize: 15,
            ),
            SizedBox(
              height: 20,
            ),
            formlabel(
              text: 'Email',
              fontSize: 18,
            ),
            SizedBox(height: 10),
            formtextfield(hinttext: 'hellojohn@gmail.com',  ),
            SizedBox(
              height: 10,
            ),
            formlabel(
              text: 'Password',
              fontSize: 18,
            ),
            SizedBox(
              height: 10,
            ),
            formtextfield(),
          ],
        ),
      ),
    );
  }
}
