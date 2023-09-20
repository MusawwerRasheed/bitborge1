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
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RiskWarning extends StatefulWidget {
  const RiskWarning({Key? key});

  @override
  State<RiskWarning> createState() => _RiskWarningState();
}

class _RiskWarningState extends State<RiskWarning> {
  @override
  Widget build(BuildContext context) {
    // Initialize flutter_screenutil for responsive design
    ScreenUtil.init(context, designSize: Size(360, 640), );

    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      appBar: CustomAppBar(
        mainpic: SvgPicture.asset(Assets.logomajor),
      ),
      body: Container(
        height: 700.h, // Use responsive height
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(22.w), // Use responsive padding
              child: GestureDetector(
                onTap: () {
                  Navigate.to(context, CreateAccount());
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset(Assets.crosscircle),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(18.w), // Use responsive padding
              child: formlabel(
                align: Alignment.topLeft,
                text: Strings.riskwarning,
                color: Colors.grey,
                fontSize: 25.sp, // Use responsive font size
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w, // Use responsive horizontal padding
                vertical: 60.h, // Use responsive vertical padding
              ),
              child: Column(
                children: [
                  Text(textScaleFactor: 1.0,
                    'The sun is a huge ball of gases. It has a diameter of 1,392,000 km. It is so huge that it can hold millions of planets inside it. The Sun is mainly made up of hydrogen and helium gas. The surface of the Sun is known as the photosphere. The photosphere is surrounded by a thin layer of gas known as the chromospheres. Without the Sun, there would be no life on Earth. There would be no plants, no animals and no human beings. As, all the living things on Earth get their energy from the Sun for their survival.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Montserrat Regular',
                      fontSize: 16.sp, // Use responsive font size
                    ),
                  ),
                  SizedBox(height: 4.h), // Use responsive height
                  Text(textScaleFactor: 1.0,
                    'The sun is a huge ball of gases. It has a diameter of 1,392,000 km. It is so huge that it can hold millions of planets inside it. The Sun is mainly made up of hydrogen and helium gas. The surface of the Sun is known as the photosphere. The photosphere is surrounded by a thin layer of gas known as the chromospheres. ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Montserrat Regular',
                      fontSize: 16.sp, // Use responsive font size
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.w), // Use responsive radius
            topRight: Radius.circular(20.w), // Use responsive radius
          ),
          color: AppColors.secondarycolor,
        ),
      ),
    );
  }
}

