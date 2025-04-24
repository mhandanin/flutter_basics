import 'package:flutter/material.dart';

class Tp6List extends StatelessWidget {
  const Tp6List({Key? key});
  @override
  Widget build(BuildContext context) {
    var liste = ["JAVA","KOTLIN","DART","SWIFT"];
    var grade = 800;
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView.builder(
        itemBuilder: (context,index){
          grade -= 200;
          return  Container(
            height: 50,
            color: Colors.lightBlue[grade],
            child: Text(liste[index], style: TextStyle(fontSize: 30)),
          );
        },
        itemCount: liste.length,
      )

    );
  }
}