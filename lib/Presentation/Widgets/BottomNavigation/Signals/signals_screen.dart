import 'package:bitborge/Application/NavigationServices/Navigation.dart';
import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Presentation/Common/appbar.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/Signals/Components/signal_tile.dart';
import 'package:bitborge/Presentation/Widgets/BottomNavigation/Signals/Components/signal_tile_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


 class signalsScreen extends StatefulWidget {

  // ignore: prefer_typing_uninitialized_variables
  final scaffoldKey;  
  const signalsScreen({super.key, required this.scaffoldKey}); // Change 'scaffoldkey' to 'scaffoldKey'


  @override
  State<signalsScreen> createState() => signalsScreenState();
}


class signalsScreenState extends State<signalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      body: 
      Container(child: 
      ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return 
                  const SignalsTile();
            })
      ),


      backgroundColor: AppColors.primarycolor,
      appBar: CustomAppBar( 
        leadingfunction: () {
          widget.scaffoldKey.currentState!.openDrawer(); // Access 'scaffoldKey' using 'widget.'
        },
        shownotificationicon: true, 
        texttitle: 'Signals',
        leading: SvgPicture.asset(Assets.dropdown),
      ),
    );
  }
}
