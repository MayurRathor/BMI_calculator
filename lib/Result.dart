import 'package:flutter/material.dart';
import 'package:number_slide_animation/number_slide_animation_widget.dart';

class Result extends StatefulWidget {
  final data;
  Result({this.data});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   child: NumberSlideAnimation(
          //     number: "${widget.data.substring(0, 2)}",
          //     duration: const Duration(seconds: 1),
          //     curve: Curves.bounceIn,
          //     textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          //   ),
          // ),
          Text("${widget.data.substring(0, 2)}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(". ${widget.data.substring(3, 5)} / Normal BMI",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
