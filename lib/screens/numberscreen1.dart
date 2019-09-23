// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/services.dart';
// import 'package:flash_chat/rounded_button.dart';
// import 'package:flash_chat/constants.dart';


// class New extends StatefulWidget {
//   static const String id = 'number_screen';
//   @override
//   _NewState createState() => _NewState();
// }

// class _NewState extends State<New> {
  
//   String text = 'Verify';
//   bool isvisible=false;
//   String name, no, pass, cpass, wel = 'Welcome', verificationId, smsCode;
//   bool check = false, smscheck = false, uc = false;

//   Future<Null> verify() async {
//     final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
//       verificationId = verId;
//     };

//     final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
//       this.verificationId = verId;
//       smsCodeDialog(context);
//     };

//     final PhoneVerificationCompleted verifiedSuccess = (AuthCredential user) {
//       print('verified');
//     };

//     final PhoneVerificationFailed veriFailed = (AuthException exception) {
//       print('${exception.message}');
//     };
//     await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: no,
//         codeAutoRetrievalTimeout: autoRetrieve,
//         codeSent: smsCodeSent,
//         timeout: const Duration(seconds: 3),
//         verificationCompleted: verifiedSuccess,
//         verificationFailed: veriFailed);
//   }

//   Future<bool> smsCodeDialog(BuildContext context) {
//     return 
//   }

//   signIn() async {
//     final AuthCredential credential = PhoneAuthProvider.getCredential(
//       verificationId: verificationId,
//       smsCode: smsCode,
//     );
//     //final AuthCredential credential = PhoneAuthProvider.getCredential( verificationId: verificationId, smsCode: smsCode, );
//     final AuthResult user =
//         await FirebaseAuth.instance.signInWithCredential(credential);
//     final FirebaseUser currentUser =
//         await FirebaseAuth.instance.currentUser().then((user) {
//       setState(() {
//         smscheck = true;
//       });
//     });
//   }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     );
//   }
// }