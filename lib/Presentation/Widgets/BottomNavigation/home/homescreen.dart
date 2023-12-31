import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Presentation/Common/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

 class HomeScreen extends StatefulWidget {
  final scaffoldKey; // Change 'var' to 'final'
  
  HomeScreen({super.key, required this.scaffoldKey}); // Change 'scaffoldkey' to 'scaffoldKey'

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      backgroundColor: AppColors.primarycolor,
      appBar: CustomAppBar( 
        leadingfunction: () {
          widget.scaffoldKey.currentState!.openDrawer(); // Access 'scaffoldKey' using 'widget.'
        },
        shownotificationicon: true, 
        texttitle: 'home',
        leading: SvgPicture.asset(Assets.dropdown),
      ),
    );
  }
}
