import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class mydrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("ahmed"),
              accountEmail: Text("naji"),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://cdn-www.bluestacks.com/bs-images/ddtank-brasil-battlegrounds_banner.jpg"),
                      fit: BoxFit.cover))),
          ListTile(
              title: Text("الصفحة الرئسية",
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              leading: Icon(
                Icons.home,
                color: Colors.deepPurple,
                size: 25,
              ),onTap: (){
                Navigator.of(context).pushNamed('home');
          },
          ),
          ListTile(
            title: Text("العروض",
                style: TextStyle(color: Colors.black, fontSize: 20)),
            leading: Icon(Icons.home, color: Colors.deepPurple, size: 25),
            onTap: (){
              Navigator.of(context).pushNamed('categories');
            },
          ),
          Divider(), //لعمل فاصل بين اللستة
          ListTile(
            title: Text("حول التطبيق",
                style: TextStyle(color: Colors.black, fontSize: 20)),
            leading: Icon(Icons.home, color: Colors.deepPurple, size: 25),
          ),
          ListTile(
            title: Text("الاعدادات",
                style: TextStyle(color: Colors.black, fontSize: 20)),
            leading: Icon(Icons.home, color: Colors.deepPurple, size: 25),
          ),
          ListTile(
            title: Text("تسجيل خروج",
                style: TextStyle(color: Colors.black, fontSize: 20)),
            leading: Icon(Icons.home, color: Colors.deepPurple, size: 25),
          ),
        ],
      ),
    );
  }
  
}