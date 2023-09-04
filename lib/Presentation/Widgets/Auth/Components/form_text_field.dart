import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class formtextfield extends StatelessWidget {
  final SvgPicture? icon;
  final String? hinttext;
  
  const formtextfield({
    super.key, this.icon, this.hinttext, 
  
  });

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      child: TextField(
        decoration: InputDecoration(         
          filled: true,
          fillColor: Color.fromARGB(255, 66, 69, 82), // Grey background color
          hintText: hinttext,
          hintStyle: Styles.montSerratRegular(context, fontSize: 18, color: Color.fromARGB(255, 168, 167, 167)), // Grey hint text
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // Rounded edges
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: icon),
          ), // Leading icon
        ),
      );
    
  }
}

 