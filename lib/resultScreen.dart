import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';

class ResultPage extends StatelessWidget{

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text("LogOut"),
          onPressed: (){
            auth.signOut();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => MyHomePage()));
          },
        ),
      ),
    );
  }
}