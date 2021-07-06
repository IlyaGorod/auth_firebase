import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_firebase/resultScreen.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _email;
  String _password;

  final FirebaseAuth _frbAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration/Authentication'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(30),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.email),
                    labelText: "Email",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.blue[100], width: 2)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.blue, width: 2)
                    )
                ),
                onChanged: (value){
                  setState(() {
                    _email = value.trim();
                  });
                },
              )
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30, right: 30, left: 30),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  suffixIcon:  Icon(Icons.lock),
                  labelText: "Password",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.blue[100], width: 2)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2)
                  )
              ),
              onChanged: (value){
                setState(() {
                  _password = value.trim();
                });
              },
              obscureText: true,
            ),
          ),

          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  color: Colors.green,
                  child: Text("SignIn", style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    _frbAuth.signInWithEmailAndPassword(email: _email, password: _password);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ResultPage()));
                  },
                ),
                RaisedButton(
                  color: Colors.green,
                  child: Text("SignUp", style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    _frbAuth.createUserWithEmailAndPassword(email: _email, password: _password);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ResultPage()));
                  },
                ),
              ]
          )
        ],
      ),
    );
  }
}

