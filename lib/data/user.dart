import 'package:firebase_auth/firebase_auth.dart';


   class ThisUser{
     String id;

     ThisUser.fromFirebase(User user){
       id = user.uid;
     }

   }