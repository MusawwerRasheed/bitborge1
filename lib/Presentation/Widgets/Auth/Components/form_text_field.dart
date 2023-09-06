import 'package:bitborge/Application/NavigationServices/Navigation.dart';
import 'package:bitborge/Data/DataSource/Static/assets.dart';
import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:bitborge/Data/DataSource/Static/text_styles.dart';
import 'package:bitborge/Presentation/Widgets/Intro/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class formtextfield extends StatefulWidget {
  final SvgPicture? icon;
  final String? hinttext;
  final SvgPicture? righticon;
    bool obscureval;
  final TextEditingController? controller;

  formtextfield({
    super.key,
    this.icon,
    this.hinttext,
    this.righticon,
    required this.obscureval,
    this.controller,
  });

  @override
  State<formtextfield> createState() => _formtextfieldState();
}

class _formtextfieldState extends State<formtextfield> {  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureval,
        decoration: InputDecoration(
          
          filled: true,
          fillColor: Color.fromARGB(255, 66, 69, 82), // Grey background color
          hintText: widget.hinttext,
          hintStyle: Styles.montSerratRegular(context,
              fontSize: 18,
              color: Color.fromARGB(255, 168, 167, 167)), // Grey hint text
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // Rounded edges
          ),
          prefixIcon: Padding(padding: const EdgeInsets.all(12.0), child: widget.icon),
          suffixIcon: GestureDetector( onTap: (){  

            setState(() {

             if(widget.obscureval ==false){
              widget.obscureval = true;
             } 
             else{ widget.obscureval =false; }
                     });

          } ,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: widget.righticon,
            ),
          ),
          
        ),
        style: Styles.montSerratRegular(context,
            color: Colors.grey, fontSize: 18), // Leading icon
      ),
    );
  }
 }
