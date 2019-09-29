// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// abstract class email{
//   Future<String>signIn(String email,String password);
//    Future<void> signOut();
// }
// abstract class Auth implements email {
//    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//    @override
//    Future<String> signUp(String username, String email, String password) async {
//       FirebaseUser user = (await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)) as FirebaseUser;
//      try {
//         await user.sendEmailVerification();
//         return user.uid;
//      } catch (e) {
//         print("An error occured while trying to send email        verification");
//         print(e.message);
//      }
//    }





// }