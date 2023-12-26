import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';

class calcbutton extends StatelessWidget {
  final String btntxt;
  final Color btncolor;
  final Color txtcolor;
  const calcbutton(this.btntxt , this.btncolor , this.txtcolor ,{super.key});

  @override
  Widget build(BuildContext context) {
    var _controller=Get.put<CalculatorController>(CalculatorController());

    dynamic displaytxt = 20;

    double width =MediaQuery.of(context).size.width;
    double height =MediaQuery.of(context).size.height;
    return Container(
      width: width*0.2,
      height: height*0.1,
      decoration: BoxDecoration(
        color: btncolor, // Background color
        borderRadius: BorderRadius.circular(50), // Border radius
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: btncolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50), // Border radius for the button
          ),// Background color for the ElevatedButton
        ),
        onPressed: (){
          _controller.calculation(btntxt);
        },
        child: Text('$btntxt',

          style: TextStyle(
              fontSize: 35,
              color: txtcolor,
              overflow: TextOverflow.clip
          ),
        ),

      ),
    );
  }
}
