import 'package:basic_calc/widget/calcbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/controller.dart';

class CalcHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var _controller=Get.put<CalculatorController>(CalculatorController());

    //Calculator
    double width =MediaQuery.of(context).size.width;
    double height =MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator',
          style: TextStyle(
              fontSize: 30
          ),),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Calculator display
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text('${_controller.text}'.toString() ,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 100,
                        ),),
                    ),
                  ],
                );
              },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('AC',Colors.grey,Colors.black),
                calcbutton('+/-',Colors.grey,Colors.black),
                calcbutton('%',Colors.grey,Colors.black),
                calcbutton('/',Colors.amber[700]!,Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('7',Colors.grey[850]!,Colors.white),
                calcbutton('8',Colors.grey[850]!,Colors.white),
                calcbutton('9',Colors.grey[850]!,Colors.white),
                calcbutton('x',Colors.amber[700]!,Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('4',Colors.grey[850]!,Colors.white),
                calcbutton('5',Colors.grey[850]!,Colors.white),
                calcbutton('6',Colors.grey[850]!,Colors.white),
                calcbutton('-',Colors.amber[700]!,Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('1',Colors.grey[850]!,Colors.white),
                calcbutton('2',Colors.grey[850]!,Colors.white),
                calcbutton('3',Colors.grey[850]!,Colors.white),
                calcbutton('+',Colors.amber[700]!,Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 80,
                  width: 160,
                  child: ElevatedButton(

                    onPressed: (){
                      _controller.calculation('0');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[850]!, // Background color for the ElevatedButton
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50), // Border radius for the button
                      ),
                    ),
                    child: Text('0',
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white),
                    ),
                  ),
                ),
                calcbutton('.',Colors.grey[850]!,Colors.white),

                calcbutton('=',Colors.amber[700]!,Colors.white),
              ],
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
