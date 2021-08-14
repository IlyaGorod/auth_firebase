import 'package:flutter/cupertino.dart';
import 'package:flutter_auth_firebase/data/user.dart';
import 'package:flutter_auth_firebase/presentation/homePage.dart';
import 'package:flutter_auth_firebase/presentation/logoutScreen.dart';
import 'package:provider/provider.dart';


class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ThisUser user = Provider.of<ThisUser>(context);
    final bool isLoggedIn = user != null;

    return isLoggedIn ? ResultPage() : MyHomePage();
  }
}