import 'package:bitborge/Data/DataSource/Static/color_pallets.dart';
import 'package:flutter/material.dart';


class checkbox extends StatefulWidget {
  const checkbox({
    super.key,
  });

  @override
  State<checkbox> createState() => _checkboxState();

}

class _checkboxState extends State<checkbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return  Checkbox(
   fillColor: MaterialStateProperty.resolveWith((states) {
return AppColors.yellowcolor; 
   }),
    
            
          value: isChecked,
          onChanged: (bool? newValue) {
            setState(() {
              isChecked = newValue!;
            });
          },
        );
       
    

  }
}