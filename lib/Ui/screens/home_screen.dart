import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app/Ui/Widgets/Button.dart';
import 'package:test_app/Ui/Widgets/text_field.dart';
import 'package:test_app/Ui/screens/money_screen.dart';
import 'package:test_app/compount/mydrawer.dart';
import 'package:test_app/models/variables.dart';
import'package:test_app/database_helper/sql_helper.dart';
import 'package:repository_hive/repository_hive.dart';



class StudentDetail extends StatefulWidget{

  Student student;
  String screenTitle;
  StudentDetail(this.student,this.screenTitle);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Students(this.student,this.screenTitle);
  }
}

class Students extends State<StudentDetail> {
  TextEditingController studentName = new TextEditingController();
  TextEditingController studentDetail = new TextEditingController();

  static var _status = ["successed", "failed"];
  String screenTitle;
  Student student;
  SQL_Helper helper = new SQL_Helper();


  Students(this.student, this.screenTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .title;

    studentName.text = student.name;
    studentDetail.text = student.description;

    // TODO: implement build
    // WillPopscope ضغط الغلف الهاصة بالجوال
    return Scaffold(
        appBar: AppBar(

          title: Text(screenTitle,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          leading: IconButton(
            icon: Icon(Icons.attach_money),
            onPressed: () {
              golist();
            },
          ),
          bottom: PreferredSize(
            preferredSize: Size(30, 30),
            child: Container(
            ),
          ),
        ),
        endDrawer: mydrawer(),

        body:
        SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Container(height: 150,
                    color: Colors.red,
                    child: Image.asset('images/55.jpg', fit: BoxFit.fill)),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 20.0),
                  child: TextField(
                    controller: studentName,
                    style: textStyle,
                    onChanged: (value) {
                      student.name = value;
                    },
                    decoration: InputDecoration(
                        labelText: "كم المبلغ الذي قمت بصرفه",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: studentDetail,
                    style: textStyle,
                    onChanged: (value) {
                      student.description = value;
                    },
                    decoration: InputDecoration(
                        labelText: "ماهو الشي الذي قمت بشرائه",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[


                      Container(height: 100,
                        child: RaisedButton(
                          color: Colors.deepPurple,
                          splashColor: Colors.purpleAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            'تسجيل النقود',
                            textScaleFactor: 1.5,

                          ),
                          textColor: Colors.white,
                          onPressed: () {
                            setState(() {
                              debugPrint("تم التسجيل");
                              _save();
                            });
                          },
                        ),
                      ),


                      //  Container(width: 5.0,),

                      //   Expanded(
                      //   child: RaisedButton(
                      //    color: Theme
                      //       .of(context)
                      //      .primaryColorDark,
                      //      textColor: Theme
                      //    .of(context)
                      //      .primaryColorLight,
                      //    child:
                      //  Text(
                      //     'Delete', textScaleFactor: 1.5,
                      //   ),
                      //    onPressed: () {
                      //     setState(() {
                      //       debugPrint("User Click Delete");
                      //       _delete();
                      //  });
                      //   },
                      //   ),
                      //  ),
                    ],
                  ),

                ),
              ]
          ),
        )
    );
  }

  void _save() async {
    //goBack();
    golist();



    student.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (student.id == null) {
      result = await helper.insertStudent(student);
    } else {
      result = await helper.updateStudent(student);
    }
    if (result == 0) {
     // showAlertDialog('اسف', "لم يتم التسجيل");
      print("تم التسجيل");
    } else {
     // showAlertDialog('تهانينا', 'لقد قمت بتسجيل المصاريف');
      print("تم ");

    }
  }

  void goBack() {
    Navigator.pop(context, true);
  }

  void golist() {
    Navigator.of(context).pushNamed("moneylist");


    void setPassing(String value) {
      switch (value) {
        case "successed":
          student.pass = 1;
          break;
        case "failed":
          student.pass = 2;
          break;
      }
    }

    String getPassing(int value) {
      String pass;
      switch (value) {
        case 1:
          pass = _status[0];
          break;
        case 2:
          pass = _status[1];
          break;
      }
      return pass;
    }


    void showAlertDialog(String title, String msg) {
      AlertDialog alertDialog = AlertDialog(
        title: Text(title),
        content: Text(msg),
      );
      showDialog(context: context, builder: (_) => alertDialog);
    }

    void _delete() async {
      goBack();

      if (student.id == null) {
        showAlertDialog('Ok Delete', "No student was deleted");
        return;
      }

      int result = await helper.deleteStudent(student.id);
      if (result == 0) {
        showAlertDialog('Ok Delete', "No student was deleted");
      } else {
        showAlertDialog('Ok Delete', "Student has been deleted");
      }
    }
  }

}