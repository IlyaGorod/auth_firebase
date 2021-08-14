import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_firebase/data/authServices.dart';
import 'package:flutter_auth_firebase/data/user.dart';
import 'package:flutter_auth_firebase/presentation/logoutScreen.dart';
import 'package:flutter_auth_firebase/presentation/validation.dart';
import 'package:fluttertoast/fluttertoast.dart';


 class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


 class _MyHomePageState extends State<MyHomePage> {

   TextEditingController _emailController = TextEditingController();
   TextEditingController _passwordController = TextEditingController();

   String _email;
   String _password;

   final GlobalKey<FormState> _key = GlobalKey<FormState>();

   AuthService _authServices = AuthService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Registration/Authentication'),
        centerTitle: true,
      ),
      body: Form(
        key: _key,
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(30),
              child: TextFormField(
                controller: _emailController,
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
                /*onChanged: (value){
                  setState(() {
                    _email = value.trim();
                  });
                },*/
                validator: ValidationClass().validationEmail,
              )
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 30, right: 30, left: 30),
            child: TextFormField(
              controller: _passwordController,
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
             /* onChanged: (value){
                setState(() {
                  _password = value.trim();
                });
              },*/
              validator: ValidationClass().validationPassword,
              obscureText: true,
            ),
          ),

          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  style: elevatedButtonStyle,
                  child: Text("Sign In"),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                      _signInButtonAction();
                  },
                ),
                ElevatedButton(
                  style: elevatedButtonStyle,
                  child: Text("Sign Up"),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                      _registerButtonAction();
                  },
                ),
              ],
          ),
        ],
       ),
      ),
    );
  }



  final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.green,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(7)),
    ),
  );



   void _signInButtonAction() async {
    _email = _emailController.text.trim();
    _password = _passwordController.text.trim();

     if (_key.currentState.validate()) {
       ThisUser user = await _authServices.signInWithEmailAndPassword(_email, _password);
       if (user == null) {
         Fluttertoast.showToast(
           msg: "User is not found",
           timeInSecForIosWeb: 1,
         );
       }else{
         Navigator.of(context).pushReplacement(MaterialPageRoute
           (builder: (context) => ResultPage()));
       }
       _emailController.clear();
       _passwordController.clear();
     }
   }

   void _registerButtonAction() async {
     _email = _emailController.text.trim();
     _password = _passwordController.text.trim();

     if (_key.currentState.validate()) {
       ThisUser user = await _authServices.registerWithEmailAndPassword(_email, _password);
       if (user == null) {
         Fluttertoast.showToast(
           msg: "User is not registered",
           timeInSecForIosWeb: 1,
         );
       }else{
         Navigator.of(context).pushReplacement(MaterialPageRoute
           (builder: (context) => ResultPage()));
       }
       _emailController.clear();
       _passwordController.clear();
     }
   }

}

