import 'package:flutter/material.dart';
import 'package:test_app/Ui/screens/money_screen.dart';
import 'package:test_app/Ui/screens/test.dart';
import 'Ui/Widgets/Button.dart';
import 'Ui/screens/home_screen.dart';
import 'Ui/screens/intro_screen.dart';
import 'package:test_app/models/variables.dart';
void main() {
  runApp(MyApp());
}



class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyApp();
  }

}

class _MyApp extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ahmad ',
      theme: ThemeData(
        fontFamily: 'Cairo',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xfff2f9fe),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]),
            borderRadius: BorderRadius.circular(25),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]),
            borderRadius: BorderRadius.circular(25),


          ),
        ),
      ),
      home:
      intro_screen(),
      routes: {
        'moneylist':(context){
          return moneylist();
        }
      },
    );
  }
}