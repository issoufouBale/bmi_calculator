import 'package:bmi_app/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Result extends StatelessWidget {
  final String bmi;
  Result({this.bmi});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KGB,
      appBar: AppBar(
        backgroundColor: KGB,
        title: Center(child: Text("BMI calculator",style: kBodyStyle,)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text('Your result is:',style: kBodyStyle ,),
          Center(child: Text(bmi,style: kResultTextStyle,)),

          GestureDetector(

            onTap: (){

              Navigator.pop(context);
            },
            child: Container(

              color:kBottomContainerColor ,
              height: 50.0,
              child: Center(child: Text('Go back',style: kLargeBottomStyle,)),
            ),
          )
        ],
      ),
    );
  }
}
