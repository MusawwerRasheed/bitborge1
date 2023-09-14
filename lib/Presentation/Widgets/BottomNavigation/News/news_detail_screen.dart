import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Common/app_text.dart';
import 'package:bitborge/Presentation/Common/appbar.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/Components/custom_drawer.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/News/Components/news_tile.dart';
import 'package:bitborge/Presentation/Widgets/Notification/Components/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

 
 class NewsScreen extends StatelessWidget {
  List<String> titles = ['Positive', 'Negative', 'Neutral'];

  var scaffoldkey;

  NewsScreen({super.key, this.scaffoldkey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      
        Column(
          children: [
          Padding(
            padding: const EdgeInsets.only(left:15.0),
            child: Align( alignment: Alignment.topLeft,
              child: AppText('100 News Found', style: Styles.montSerratRegular(context, color: AppColors.grettext),)),
          ),
                     Expanded(
              child: ListView.builder(
                 physics: const BouncingScrollPhysics(),
                 itemCount: titles.length, // Use the length of the titles list
                 itemBuilder: (BuildContext context, index) {
                   // Access each item from the titles list using index
                   String title = titles[index];
                    return NewsTile(
                      tag: title,
                   );
                 },
               ),
            ),
          ],
        ),
    


      backgroundColor: AppColors.primarycolor,
      appBar: CustomAppBar(
        leading: SvgPicture.asset(Assets.dropdown),
        shownotificationicon: true,
        leadingfunction: () {
          scaffoldkey.currentState!.openDrawer();
        },
        texttitle: 'News',
      ),
    );
  }
}
















// class NewsScreen extends StatefulWidget {
// final dynamic scaffoldKey;
//    NewsScreen({super.key, required this.scaffoldKey});
//   @override
//   State<NewsScreen> createState() => _NewsScreenState();
// }


// class _NewsScreenState extends State<NewsScreen> {

 

  

//   @override
//   Widget build(BuildContext context) {
   
     
//     // var scaffoldKey;
//     //  print('global scaffold key is $scaffoldKey');
//     return Scaffold(
//       backgroundColor: AppColors.primarycolor,
//       // key: scaffoldKey,
       
//     appBar: CustomAppBar(texttitle: 'News', leading: SvgPicture.asset(Assets.dropdown),
//     leadingfunction: (){
//       // printi();
//       // scaffoldKey.currentState.openDrawer();
//       // print('scaffoldKey is $scaffoldKey');
//     },),

// drawer: CustomDrawer(),

// body:    
//  Container(
//       child: ListView.builder(
//         physics: BouncingScrollPhysics() ,
//         itemCount: 4,
//         itemBuilder: (context,index){
//         return NewsTile();
//       }),
//     ),
//     );
//   }
// }



