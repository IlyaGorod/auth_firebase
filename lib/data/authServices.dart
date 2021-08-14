import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth_firebase/data/user.dart';


class AuthService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

   Future<ThisUser> signInWithEmailAndPassword(String email, String password) async{
      try {
        UserCredential authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
         User user = authResult.user;
         return ThisUser.fromFirebase(user);
      }catch (e){
         return null;
      }
   }

  Future<ThisUser> registerWithEmailAndPassword(String email, String password) async{
    try {
      UserCredential authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User user = authResult.user;
      return ThisUser.fromFirebase(user);
    }catch (e){
      return null;
    }
  }

  Future logOut() async{
     await _firebaseAuth.signOut();
  }

  Stream<ThisUser> get currentUser{
     return _firebaseAuth.authStateChanges()
         .map((User user) => user != null ? ThisUser.fromFirebase(user)
           : null);
  }
}