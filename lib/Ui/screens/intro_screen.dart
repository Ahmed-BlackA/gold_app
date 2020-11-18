import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_app/compount/mydrawer.dart';
import 'package:test_app/ui/Widgets/Button.dart';
import 'package:test_app/Ui/screens/intro_screen.dart';
import 'package:test_app/Ui/screens/home_screen.dart';
import 'package:test_app/models/variables.dart';
import'package:test_app/database_helper/sql_helper.dart';
import 'package:carousel_pro/carousel_pro.dart';
class intro_screen extends StatefulWidget{

  @override
  Student student;
  SQL_Helper helper = new SQL_Helper();
  List<Student> studentsList;
  int count = 0;

  State<StatefulWidget> createState() {
    if (studentsList == null) {
      studentsList = new List<Student>();

    }
    return _intro_screen();
  }

}

class _intro_screen extends State<intro_screen> {

  Student student;
  SQL_Helper helper = new SQL_Helper();
  List<Student> studentsList;

  @override
  _intro_screen();
  Widget build(BuildContext context) {


    // TODO: implement build
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("تطبيق معرفة المصاريف",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700),),
        centerTitle: true,


        bottom: PreferredSize(
          preferredSize: Size(80,80),
          child: Container(
          ),
        ),
      ),
      drawer: mydrawer(),

      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(),
            Image.asset('images/55.jpg'),
            SizedBox(
                height: 50,
                width: double.infinity,
                child: Button(text:'ابدا الان',
                  color: Colors.deepPurple,
                  splashColor: Colors.blue,
                  textColor: Colors.white,
                  onPressed:(){
                    navigateToStudent(Student("", '', 0, ''),"اضافة مصاريف جديدة");
                  } ,)
              //padding: EdgeInsets.symmetric(vertical: 18,horizontal: 160),
            )

          ],
        ),
      ),

    ));
  }


  void navigateToStudent(Student student,String screenTitle,) async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) {
      return StudentDetail(student,screenTitle);
    }));


  }


}


