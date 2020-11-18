import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final Color splashColor;

  const Button({Key key, this.text, this.onPressed, this.color, this.textColor,this.splashColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: 50,
        width: double.infinity,
     child: RaisedButton(
        onPressed: onPressed,

        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 23,fontWeight: FontWeight.w700),
        ),
       color:color,
        splashColor:splashColor ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),


    ),
    );
  }
}
