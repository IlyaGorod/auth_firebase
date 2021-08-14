import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_firebase/data/authServices.dart';

import 'homePage.dart';

class ResultPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(7)),
              )),
          child: Text("Log Out"),
          onPressed: (){
            AuthService().logOut();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => MyHomePage()));
          },
        ),
      ),
    );
  }
}