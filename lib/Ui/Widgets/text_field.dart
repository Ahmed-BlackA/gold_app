
import 'package:flutter/material.dart';
class textfiled extends StatelessWidget {
  @override
  final String variable;
  final String controller ;
  final String text;

  const textfiled({Key key, this.variable, this.controller, this.text}) : super(key: key);



  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        child:Padding (
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child:TextFormField(
              decoration: InputDecoration(
                labelText: text ,
              ),

              onSaved: (vaule){
                vaule=variable;
              },
              validator: (vaule) => vaule.isEmpty ? 'ادخل اي قيمة ':null,
            )


        )
    );

  }

}