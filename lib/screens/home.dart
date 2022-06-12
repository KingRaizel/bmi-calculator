// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, library_prefixes, prefer_final_fields, unnecessary_string_escapes

import 'package:bmi_calc/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calc/widgets/left_bar.dart';
import 'package:bmi_calc/widgets/right_bar.dart';

import '../widgets/left_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiresult = 0;
  String _textresult = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 29,
          ),
        ),
        backgroundColor: accentHexColor,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  width: 170,
                  child: Card(
                    color: Colors.transparent,
                    child: TextField(
                      controller: _heightController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  width: 170,
                  child: Card(
                    color: Colors.transparent,
                    child: TextField(
                      controller: _weightController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiresult = _w / (_h * _h);
                  if (_bmiresult > 25) {
                    _textresult = "You're over weight 🙁";
                  } else if (_bmiresult >= 18.5 && _bmiresult <= 25) {
                    _textresult = "You have Normal weight 😀";
                  } else {
                    _textresult = "You're under weight 😕";
                  }
                });
              },
              child: Container(
                  width: 150,
                  padding: EdgeInsets.all(12),
                  child: Card(
                    color: Color.fromARGB(255, 48, 46, 46),
                    child: Text(
                      'Calculate',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: accentHexColor,
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Text(
                _bmiresult.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 90,
                  color: accentHexColor,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textresult.isNotEmpty,
              child: Container(
                  child: Text(
                _textresult,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 30,
                  color: accentHexColor,
                ),
              )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                child: Text("Height in 'metres' & Weight in 'Kgs'",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 25,
                      color: accentHexColor,
                    ))),
            SizedBox(
              height: 20,
            ),
            LeftBar(
              barWidth: 40,
            ),
            SizedBox(
              height: 10,
            ),
            LeftBar(
              barWidth: 80,
            ),
            SizedBox(
              height: 10,
            ),
            LeftBar(
              barWidth: 40,
            ),
            SizedBox(
              height: 10,
            ),
            RightBar(
              barWidth: 40,
            ),
            SizedBox(
              height: 15,
            ),
            RightBar(
              barWidth: 80,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
