
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class test extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _test();
  }

}

class _test extends State<test> {
  Future getDate ()async{
    var url = "https://jsonplaceholder.typicode.com/posts";
    var response = await http.get(url);
    var responsebody = await jsonDecode(response.body);
    print(responsebody);

  }
  @override
  void initState() {
    getDate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: Text("اهلا وسهلا"),
    );
  }

}