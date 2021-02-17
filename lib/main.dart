import 'package:bmi_app/FirstPage.dart';
import 'package:bmi_app/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_app/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    WidgetsApp.debugAllowBannerOverride = false;
    return MaterialApp(
      title: 'App',
      theme: ThemeData.dark(),
      home: First(),
    );
  }
}

class InputPage extends StatefulWidget {



  @override
  _InputPageState createState() => _InputPageState();
}
enum Gender{
  male,femelle
}
class _InputPageState extends State<InputPage> {

Gender gender;
var age =20;
var height=150;
var  weight =30;


  @override
  Widget build(BuildContext context) {


    return Scaffold(
backgroundColor: KGB,
      appBar: AppBar(
        backgroundColor: KGB,

        title: Text("Body mass index ", style:kBodyStyle ,),
        centerTitle: true,
      ),
      body: Column(
        children:<Widget> [
          Expanded(
            child: Row(
              children:<Widget> [
              Expanded(
                child: ReusableCard(
                  
                  Ontap: (){
                    setState(() {
                      gender=Gender.male;
                    });
                  },
                  color: gender==Gender.male?kActiveColor:kInactiveColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.mars,size: 60.0,),
                      SizedBox(height: 20.0,),
                      Text('Man',style: kBodyStyle,)
                    ],

                  ) ,
                ),),
          Expanded(child: ReusableCard(
            Ontap: (){
              setState(() {
                gender=Gender.femelle;
              });
            },
            color: gender==Gender.femelle?kActiveColor:kInactiveColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.venus,size: 60.0,),
                SizedBox(height: 20.0,),
                Text('woman',style: kBodyStyle,)
              ],

            ) ,
          ),)  ],),),
          Expanded(
            child: Row(
              children:<Widget> [
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text('Height',style: kBodyStyle,),
                       Text(height.toString(),style: kNumberStyle,),
                       Slider(
                         min: 130,
                         max: 220,
                         activeColor: kBottomContainerColor,
                         value: height.toDouble(),
                         onChanged: (value){
                           setState(() {
                             height=value.round();
                           });

                         },
                       )
                     ],
                    ),
                  ),),
                 ],),),

          Expanded(
            child: Row(
              children:<Widget> [
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Weight',style: kBodyStyle,),
                        SizedBox(height: 20.0,),
                        Text(weight.toString(),style: kNumberStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(onPressed: (){
                              setState(() {
                                weight++;
                              });

                            },
                              child: Icon(FontAwesomeIcons.plus),
                              shape: CircleBorder(),
                              constraints: BoxConstraints.tightFor(
                                height: 56.0,
                                width: 56.0,
                              ),
                              elevation: 10.0,
                              fillColor: Color(0xFF222747),
                              padding: EdgeInsets.all(5),
                            ),
                            SizedBox(width: 10.0,),
                            RawMaterialButton(onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                              child: Icon(FontAwesomeIcons.minus),
                              shape: CircleBorder(),
                              constraints: BoxConstraints.tightFor(
                                height: 56.0,
                                width: 56.0,
                              ),
                              elevation: 10.0,
                              fillColor: Color(0xFF222747),
                              padding: EdgeInsets.all(5),
                            ),

                            ],
                        )
                      ],

                    ) ,
                  ),),
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age',style: kBodyStyle,),
                        SizedBox(height: 20.0,),
                        Text(age.toString(),style: kNumberStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(onPressed: (){
                              setState(() {
                                age++;
                              });

                            },
                              child: Icon(FontAwesomeIcons.plus),
                              shape: CircleBorder(),
                              constraints: BoxConstraints.tightFor(
                                height: 56.0,
                                width: 56.0,
                              ),
                              elevation: 10.0,
                              fillColor: Color(0xFF222747),
                              padding: EdgeInsets.all(5),
                            ),
                            SizedBox(width: 10.0,),
                            RawMaterialButton(onPressed: (){
                              setState(() {
                                age--;
                              });
                            },
                              child: Icon(FontAwesomeIcons.minus),
                              shape: CircleBorder(),
                              constraints: BoxConstraints.tightFor(
                                height: 56.0,
                                width: 56.0,
                              ),
                              elevation: 10.0,
                              fillColor: Color(0xFF222747),
                              padding: EdgeInsets.all(5),
                            ),

                          ],
                        )
                      ],

                    ) ,
                  ),),
                 ],),),
      SizedBox(height:10),
        GestureDetector(

          onTap: (){
            final heightSquared = height/100;
            final res = weight/(heightSquared*heightSquared);
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=> Result(bmi: res.round().toString(),)));
          },
          child: Container(

            color:kBottomContainerColor ,
            height: 50.0,
            child: Center(child: Text('Calculate your BMI',style: kLargeBottomStyle,)),
          ),
        )
        ],
      )
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function Ontap;
  const ReusableCard({
    Key key, this.color= kInactiveColor, this.child, this.Ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: Ontap,

      child: Container(
        child: child,
        margin: EdgeInsets.all(10),
        decoration:  BoxDecoration(
          color: color,
          borderRadius:  BorderRadius.all(Radius.circular(10))
        ),

      ),
    );
  }
}
