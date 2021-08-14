import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_firebase/data/user.dart';
import 'package:flutter_auth_firebase/presentation/homePage.dart';
import 'package:provider/provider.dart';
import 'data/authServices.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<ThisUser>.value(
    value: AuthService().currentUser,
        initialData: null,
      child: MaterialApp(
      home: MyHomePage(),
      )
    );
  }
}