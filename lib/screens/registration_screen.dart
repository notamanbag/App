import 'package:flash_chat/screens/newscreen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:modal_progress_hud/modal_progress_hud.dart';


class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showspin = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
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
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kDecoration.copyWith(hintText: 'Enter your email')),
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
                    kDecoration.copyWith(hintText: 'Enter your Password')),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
                title: 'Register',
                colour: Colors.blueAccent,
                onPressed: ()async {
                  try {
                    final newuser =  await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newuser != null) {
                      Navigator.pushNamed(context, NewScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                }),
                // FloatingActionButton(
                //   child: 
                //   Color = 
                  
                //   onPressed: (){}
                  
                //   ,)
                
          ],
        ),
      ),
    );
  }
}
