import 'dart:math';
import 'package:bmi_mayur/paint.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_picker/horizontal_picker.dart';
import 'package:numberpicker/numberpicker.dart';
import 'CustomWidget.dart';
import 'Result.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Required variable
  double _userweight = 10;
  double _userheight = 145;
  double _bmi = 123456789;
  int _currentIntValue = 25;
  NumberPicker integerNumberPicker;
  int userage;
  double initialweight = 45;
  Color maleColor;
  Color femaleColor;
  String resultText = "Calculate BMI";
  Color myBgColor = Colors.deepPurpleAccent;
  Color myBgColor1 = Colors.deepPurple;
  final resultColor = Colors.green;
  final inActiveColor = Colors.white;
  final activeColor = Colors.deepPurpleAccent;
  bool toggle = true;
  double opacityValue = 0.0;
  final activeTextColor = Colors.white;
  final inActiveTextColor = Colors.grey;
  Color maleTextColor;
  Color femaleTextColor;

  @override
  void initState() {
    super.initState();
    maleColor = inActiveColor;
    femaleColor = inActiveColor;
    maleTextColor = inActiveTextColor;
    femaleTextColor = inActiveTextColor;
  }

// Function for bottom button
  calculatBMI() {
    (toggle == true) ? result() : reset();
  }

// function for result case
  result() {
    print(toggle);
    _bmi = _userweight / pow(_userheight / 100, 2);
    myBgColor = Colors.greenAccent;
    myBgColor1 = Colors.greenAccent[400];
    resultText = "Reset";
    opacityValue = 0.9;
    toggle = false;
    return _bmi;
  }

// // function for reset case
  reset() {
    print(toggle);
    toggle = true;
    resultText = "Calculate BMI";
    myBgColor = Colors.deepPurpleAccent;
    myBgColor1 = Colors.deepPurple;
    opacityValue = 0.0;
    maleColor = activeColor;
    femaleColor = inActiveColor;
    _userweight = 10;
    maleTextColor = inActiveTextColor;
  }

// Current age value when app starts
  _handleValueChanged(num value) {
    if (value != null) {
      if (value is int) {
        setState(() => _currentIntValue = value);
        userage = _currentIntValue;
      }
    }
  }

  // Main Widget starts
  @override
  Widget build(BuildContext context) {
    integerNumberPicker = NumberPicker.horizontal(
      initialValue: _currentIntValue,
      minValue: 0,
      maxValue: 100,
      step: 1,
      onChanged: _handleValueChanged,
    );
    var data = (_bmi.toString());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
// Banner Heading with result screen +++++++++++++++++++++++++++++++++++++++++++++++++++++++
            Stack(
              children: [
                CustomPaint(
                  size: Size(
                      410,
                      (410 * 0.625)
                          .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter(bgColor: myBgColor1),
                ),
                SizedBox(height: 100),
                CustomPaint(
                    size: Size(
                        380,
                        (380 * 0.625)
                            .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: RPSCustomPainter(bgColor: myBgColor)),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("BMI Calculator",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      Opacity(
                        opacity: opacityValue,
                        child: Result(
                          data: data,
                        ),
                      ),
                    ],
                  ),
                  height: 170,
                  width: double.infinity,
                  color: myBgColor,
                ),
              ],
            ),
            //Gender Selection button +++++++++++++++++++++++++++++++++++++++++++++++++++++
            Container(
              padding: EdgeInsets.only(bottom: 10, left: 40, right: 40),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Are you a ?",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GenderButton(
                        btnColor: maleColor,
                        textColor: maleTextColor,
                        onTap: () {
                          setState(() {
                            maleColor = activeColor;
                            femaleColor = inActiveColor;
                            maleTextColor = activeTextColor;
                            femaleTextColor = inActiveTextColor;
                          });
                        },
                        myicon: Icons.account_circle_outlined,
                        mytext: "Male",
                      ),
                      GenderButton(
                        btnColor: femaleColor,
                        textColor: femaleTextColor,
                        onTap: () {
                          setState(() {
                            maleColor = inActiveColor;
                            femaleColor = activeColor;
                            femaleTextColor = activeTextColor;
                            maleTextColor = inActiveTextColor;
                          });
                        },
                        myicon: Icons.account_box_outlined,
                        mytext: "female",
                      ),
                    ],
                  )
                ],
              ),
            ),
            //age Selector ++++++++++++++++++++++++++++++++++++++++++++++
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "How old are you ?",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: integerNumberPicker,
                  ),
                ],
              ),
            ),
            // Height Selector ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Height",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    child: HorizantalPicker(
                      minValue: 150,
                      maxValue: 200,
                      divisions: 100,
                      //suffix: "cm",
                      showCursor: true,
                      backgroundColor: Colors.white,
                      activeItemTextColor: Colors.deepPurple,
                      passiveItemsTextColor: Colors.black,
                      onChanged: (value) {
                        setState(() => _userheight = value);
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Weight Selector +++++++++++++++++++++++++++++++++++++++++++++++
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Weight",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 260,
                          child: Slider(
                            min: 0,
                            max: 150,
                            divisions: 100,
                            onChanged: (weight) => {
                              setState(() => _userweight = weight),
                            },
                            activeColor: Colors.deepPurple,
                            inactiveColor: Colors.lightBlue[50],
                            value: _userweight,
                          ),
                        ),
                        Text(
                          _userweight.round().toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // result button +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            Container(
              constraints: BoxConstraints(
                  maxHeight: 50, maxWidth: 300, minWidth: 300, minHeight: 50),
              // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: RaisedButton(
                  color: Color.fromARGB(255, 12, 237, 176),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () => setState(() => {
                        calculatBMI(),
                      }),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 15),
                      child: Text(
                        resultText,
                        style: TextStyle(color: Colors.white),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
