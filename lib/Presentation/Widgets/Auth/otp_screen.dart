import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/strings.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Common/appbar.dart';
import 'package:bitborge/Presentation/Common/button.dart';
import 'package:bitborge/Presentation/Widgets/Auth/Components/form_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: AppColors.whitecolor,
      ),
      decoration: BoxDecoration(
        color: AppColors.darkgrey,
        borderRadius: BorderRadius.circular(10),
        border: pinputborder,
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      appBar: CustomAppBar(
        texttitle:'',
        leading: SvgPicture.asset(Assets.leftarrow), 
        leadingfunction: (){ 
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: AppText(Strings.verificationcode,
                  style: Styles.montSerratRegular(context, fontSize: 26)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: RichText(
                  text: TextSpan(
                style: const TextStyle(color: Colors.white),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Enter the',
                    style: Styles.montSerratRegular(context, fontSize: 14),
                  ),
                  TextSpan(
                      text: ' 4 digit',
                      style: Styles.mostserratBold(context, fontSize: 14)),
                  TextSpan(
                      text: 'code that we have sent you through email',
                      style: Styles.montSerratRegular(context, fontSize: 14)),
                  TextSpan(
                      text: ' yourgmail@gmail.com',
                      style: Styles.mostserratBold(context, fontSize: 14)),
                ],
              )),
            ),
            Pinput(
              defaultPinTheme: defaultPinTheme,
              validator: (value) {
                return value == '1234' ? pinsuccess() : pinfalure();
              },
            ),
            Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
                  child: Visibility(
                    visible: rowvisibility,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(Assets.clock),
                        const SizedBox(
                          width: 5,
                        ),
                        AppText(
                          '00:10',
                          style: Styles.montSerratRegular(context,
                              color: AppColors.grettext, fontSize: 16),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        AppText(
                          Strings.resendcode,
                          style: Styles.montSerratRegular(context,
                              fontSize: 16, color: AppColors.yellowcolor),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
                  child: Visibility(
                    visible: successrowvisibility,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(Assets.check),
                        const SizedBox(
                          width: 5,
                        ),
                        AppText(
                          'Code is Verified',
                          style: Styles.montSerratRegular(context,
                              color: AppColors.greencolor, fontSize: 16),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
                  child: Visibility(
                    visible: failurerowvisibility,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        AppText(
                          'Code is unverfied',
                          style: Styles.montSerratRegular(context,
                              color: Colors.red, fontSize: 16),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  button(
                    text: 'Continue',
                    color: buttoncolor,
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  bool rowvisibility = true;
  bool successrowvisibility = false;
  bool failurerowvisibility = false;
  Color buttoncolor = AppColors.darkgrey;
  BoxBorder pinputborder = Border.all(color: AppColors.darkgrey);

  pinsuccess() {
    setState(() {
      rowvisibility = false;
      buttoncolor = AppColors.yellowcolor;
      pinputborder = Border.all(color: AppColors.greencolor);
      successrowvisibility = true;
      failurerowvisibility = false;
    });
  }

  pinfalure() {
    setState(() {
      pinputborder = Border.all(color: Colors.red);
      successrowvisibility = false;
      rowvisibility = false;
      buttoncolor = AppColors.darkgrey;
      failurerowvisibility = true;
    });
  }
}
