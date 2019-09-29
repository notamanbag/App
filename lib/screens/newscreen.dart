import 'dart:async';

import 'package:flash_chat/ChatScreen.dart';
import 'package:flash_chat/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';

class  NewScreen extends StatefulWidget {
  static const String id= 'NewScreen';
    @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  bool isvisible=false;
  String text ='Verify';
  String verificationId;
  String phoneno;
  String smsCode;


  Future<void> verify() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      verificationId = verId;
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      
    };

    final PhoneVerificationCompleted verifiedSuccess = (AuthCredential user) {
      print('verified');
    };

    final PhoneVerificationFailed veriFailed = (AuthException exception) {
      print('${exception.message}');
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber:this.phoneno,
        codeAutoRetrievalTimeout: autoRetrieve,
        codeSent: smsCodeSent,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verifiedSuccess,
        verificationFailed: veriFailed);
  }

  
  void signin() async {
    
    final AuthCredential credential = PhoneAuthProvider.getCredential(verificationId: verificationId,smsCode:smsCode );
    final FirebaseUser user = (await FirebaseAuth.instance.signInWithCredential(credential)) as FirebaseUser;
    final FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    assert(user.uid==currentUser.uid);
    print('Signed in with phonenumber');
    
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'LOGO',
              child: Container(
                height: 160.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
                keyboardType: TextInputType.phone,
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  phoneno = value;
                },
                decoration:
                    kDecoration.copyWith(hintText: 'Enter your number')),
            SizedBox(
              height: 8.0,
            ),
            Visibility(
              visible: isvisible,
              child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    smsCode= value;
                  },
                  decoration: kDecoration.copyWith(hintText: 'Enter the OTP')),
            ),
            RoundedButton(
                title: text,
                colour: Colors.blueAccent,
                onPressed: () {
                  
                    Navigator.pushNamed(context, ChatScreen.id);
                      
                      setState(() {
                      text = 'Lets Chat';
                      isvisible = true;
                  });
                    },
            ),
             FloatingActionButton(
                onPressed: () => verify(),
                tooltip: 'get code',
                  child: new Icon(Icons.send),
                   ), // This trailing comma makes auto-formatting nicer for build methods.
  ],
        ),
      ),
    );
   
      
    
  
 
  }
}

  