import 'package:bitborge/Application/NavigationServices/Navigation.dart';
import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Common/appbar.dart';
import 'package:bitborge/Presentation/Widgets/Intro/splash_screen.dart';
import 'package:bitborge/Presentation/Widgets/Notification/Components/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 10, 13, 24),
        appBar: CustomAppBar(
          leading: SvgPicture.asset(Assets.leftarrow),
          leadingfunction: ( ) {            
         
          Navigator.pop(context);
           }
,
          texttitle: 'Notifications',
        ),
        body: Column(
          children: [

           Padding(
             padding: const EdgeInsets.only(top: 15, left: 20, bottom: 10 ),
             child: Align( alignment: Alignment.topLeft,
               child: AppText('10 Notifications found' , style: Styles.montSerratRegular(context, color: 
               AppColors.grettext, fontSize: 15 ),),
             ),
           ), 

            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return const NotificationTile();
                  }),
            ),
          ],
        ));
  }
}

 














// class NotificationScreen extends StatelessWidget {
//   const NotificationScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.whitecolor,
//       appBar: AppBar(automaticallyImplyLeading: false,
//         title: AppText(
//             style: Styles.montSerratRegular(context, fontSize: 24.sp),
//             'Notifications'),
//         actions: [
//           // Padding(
//           //     padding: EdgeInsets.symmetric(horizontal: 15.w),
//           //     child: CircleIconButton(icon: Icons.close, onPressed: () {
//           //       Navigator.pop(context);
//           //     }))
//         ],
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//       ),
//       body: ListView.builder(
//         physics: const BouncingScrollPhysics(),
//         itemCount: 5,
//           itemBuilder: (context,index){
//         return ListTile();
//       }),
//     );
//   }
// }
