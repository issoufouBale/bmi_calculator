import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';

import 'const.dart';





class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String  someVeryLongText = "The World Health Organization (WHO) defined this body mass index in 1997 as the standard for assessing the risks associated with overweight in adults. She also defined standard intervals (thinness, normal index, overweight, obesity) based on the statistically observed relationship between BMI and death rate. US health insurance companies use BMI as an indicator of risk of cardiovascular accident among their policyholders and vary the premiums on the basis of this criterion. However, cardiovascular accidents are rare before the age of 65. There are more scientific ways to determine the risks, but companies cannot legally ask their policyholders for them: cholesterolemia, heart rate before and after exercise, etc.";
    return Scaffold(
      backgroundColor: KGB,
      appBar: AppBar(
        backgroundColor: KGB,
        title: Text("Welcome",style: kTitleStyle,),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
              child: Container(

                  margin: const EdgeInsets.all(10.0),

                  // adding padding
                  padding: const EdgeInsets.all(3.0),

                  // height should be fixed for vertical scrolling
                  height: 400.0,
                  decoration: BoxDecoration(

                    // adding borders around the widget
                    border: Border.all(
                      color: Colors.blueAccent,
                      width: 2.0,

                    ),
                  ),

          child: Center(child: Text(someVeryLongText,
            style: kTitleStyle,))),
                  ),

            SizedBox(height: 20,),
          Container(
            height: 50,
            width: 90,
            color: KGB,
            child:GestureDetector
              (
              child: FlatButton(
                color: Colors.blueAccent[400],
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> InputPage(),));
                },
                child: Text(
                  "Begin",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),

            ),
          ),

        ],
      )

    );
  }
}
