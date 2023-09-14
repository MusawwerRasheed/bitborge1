import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Presentation/Common/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

 
 
 class GemsScreen extends StatefulWidget {
  final scaffoldKey; // Change 'var' to 'final'
  
  GemsScreen({super.key, required this.scaffoldKey}); // Change 'scaffoldkey' to 'scaffoldKey'

  @override
  State<GemsScreen> createState() => _GemsScreenState();
}

class _GemsScreenState extends State<GemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      backgroundColor: AppColors.primarycolor,
      appBar: CustomAppBar( 
        leadingfunction: () {
          widget.scaffoldKey.currentState!.openDrawer(); // Access 'scaffoldKey' using 'widget.'
        },
        shownotificationicon: true, 
        texttitle: 'Gems',
        leading: SvgPicture.asset(Assets.dropdown),
      ),
    );
  }
}
