import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_app/Ui/screens/home_screen.dart';
import 'package:test_app/compount/mydrawer.dart';
import 'package:test_app/models/variables.dart';
import 'package:test_app/Ui/Widgets/text_field.dart';
import 'package:test_app/database_helper/sql_helper.dart';
import 'package:sqflite/sql.dart';
import 'dart:async';

class moneylist extends StatefulWidget {
  String screenTitle;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _moneylist(this.screenTitle);
  }
}

class _moneylist extends State<moneylist> {
  Student student;
  String screenTitle;
  SQL_Helper helper = new SQL_Helper();
  List<Student> studentsList;
  var count =0;
  var count2;



  _moneylist(this.screenTitle);


  @override

  @override
  Widget build(BuildContext context) {



    if (studentsList == null) {
      studentsList = new List<Student>();
      updateListView();
    }
    // TODO: implement build
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "المصاريف",
                style: TextStyle(fontSize: 25),
              ),
              centerTitle: true,
              backgroundColor: Colors.deepPurple,
              actions: [
                InkWell(
                    onTap: () {
                      goBack();
                    },
                    child: Icon(Icons.arrow_back))
              ],
            ),
            drawer: mydrawer(),
            body: getStudentsList(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                navigateToStudent(
                    Student(
                      "",
                      "",
                      1,
                      "",

                    ),
                    "تاضافة مصاريف جديدة ");
              },
              tooltip: 'اضافة جديدة',
              child: Icon(Icons.add),
            )));
  }

  ListView getStudentsList() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
      //    int varr2=int.parse(ahmed.studentName.text);

          return Container(
            height: 150,
            child: Card(
                color: Colors.white,
                elevation: 2.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "لقد قمت بصرف : ",
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: Colors.deepPurple),
                        ),
                        Expanded(
                            child: Text(
                          this.studentsList[position].name,
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: Colors.red),
                        )),
                        Text("ff"),
                        Container(
                            height: 45,
                            child: InkWell(
                                onTap: () {
                                  navigateToStudent(this.studentsList[position],
                                      "تعديل المصاريف");
                                },
                                child: Image.asset(
                                  "images/edit.png",
                                  fit: BoxFit.cover,
                                ))),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "لقد اشتريت : ",
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: Colors.deepPurple),
                        ),
                        Expanded(
                            child: Text(
                          this.studentsList[position].description,
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: Colors.red),
                        )),
                        Container(
                            height: 45,
                            child: Image.asset(
                              "images/money-logo.png",
                              fit: BoxFit.cover,
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "بتاريخ : ",
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: Colors.deepPurple),
                        ),
                        Expanded(
                            child: Text(
                          this.studentsList[position].date,
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: Colors.red),
                        )),
                        Container(
                            height: 35,
                            child: InkWell(
                                onTap: () {
                             //     _delete(context, this.studentsList[position]);
                                  return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.deepPurple,
                                          title: Center(child: Text("هل تريد حقا الحذف ؟",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white),)),

                                          actions: <Widget>[
                                            FlatButton(
                                                onPressed: (){
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("الغاء",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white))),
                                            FlatButton(
                                                onPressed: (){
                                                  _delete(context, this.studentsList[position]);
                                                  goBack();

                                                },
                                                child: Text("نعم انا متاكد",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white))),
                                          ],
                                        );
                                      });

                                },
                                child: Image.asset("images/delet-icon.png"))),
                      ],
                    ),
                  ],
                )),
          );
        });
  }

  void goBack() {
    Navigator.pop(context, true);
  }

  Color isPassed(int value) {
    switch (value) {
      case 1:
        return Colors.amber;
        break;
      case 2:
        return Colors.red;
        break;
      default:
        return Colors.amber;
    }
  }

  Icon getIcon(int value) {
    switch (value) {
      case 1:
        return Icon(Icons.check);
        break;
      case 2:
        return Icon(Icons.close);
        break;
      default:
        return Icon(Icons.check);
    }
  }

  void _delete(BuildContext context, Student student) async {
    int ressult= await helper.deleteStudent(student.id);
    if (ressult != 0) {
  //    _showSenckBar(context, "تم المسح بنجاح");
      updateListView();
    }
  }

  void _showSenckBar(BuildContext context, String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void updateListView() {
    final Future<Database> db = helper.initializedDatabase();
    db.then((database) {
      Future<List<Student>> students = helper.getStudentList();
      students.then((theList) {
        setState(() {
          this.studentsList = theList;
          this.count = theList.length;
        });
      });
    });
  }

  void navigateToStudent(Student student, String screenTitle) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return StudentDetail(student, screenTitle);
    }));

    if (result) {
      updateListView();
    }
  }
}
