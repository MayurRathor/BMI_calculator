import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  final myicon;
  final mytext;
  final Color btnColor;
  final Function onTap;
  final Color textColor;
  GenderButton(
      {this.myicon, this.mytext, this.btnColor, this.onTap, this.textColor});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      onPressed: onTap,
      child: Row(
        children: [
          Icon(
            myicon,
            color: textColor,
            size: 25.0,
          ),
          SizedBox(
            width: 10,
          ),
          Text(mytext,
              style: TextStyle(
                  color: textColor, fontSize: 13, fontWeight: FontWeight.bold)),
        ],
      ),
      color: btnColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++//
