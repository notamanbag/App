import 'dart:async';
import 'package:flash_chat/ChatScreen.dart';
import 'package:flash_chat/google_sign.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flash_chat/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showspin = false;
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  String email;
  String password;
  String number;
  Future<String> signIn(String email, String password) async {
    FirebaseUser User = await _auth.signInWithEmailAndPassword(
        email: email, password: password) as FirebaseUser;
    if (User.isEmailVerified)
      return User.uid;
    else
      print("Not Verified");
    return null;
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showspin,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'LOGO',
                child: Container(
                  height: 160.0,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration:
                      kDecoration.copyWith(hintText: 'Enter your email'),
                      ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    password = value;
                  },
                  decoration:
                      kDecoration.copyWith(hintText: 'Enter your password')),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  title: 'Register',
                  colour: Colors.blueAccent,
                  onPressed: () async {
                    setState(() {
                      showspin = true;
                    });
                    try {
                      FirebaseUser newuser =
                          (await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password))
                              .user;
                      await newuser.sendEmailVerification();
                      if (newuser.isEmailVerified) {
                        setState(() {
                          showspin = false;
                        });
                        return newuser.uid;
                      }

                      return newuser.uid;
                    } catch (e) {
                      print(e);
                    }
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new FloatingActionButton(
                    onPressed: () async {
                      await prefix0.signInWithGoogle();
                      Navigator.pushNamed(context, ChatScreen.id);
                      
                    },
                    backgroundColor: Colors.redAccent,
                    splashColor: Colors.orangeAccent,
                    child: Icon(Icons.golf_course),
                  ),
                  
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


