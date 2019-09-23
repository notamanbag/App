//import 'main.dart';




/*class NumberScreen extends StatefulWidget {
  static const String id = 'number_screen';

  @override
  _NumberScreenState createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  String text = 'Verify';
  bool isvisible = false;
  String number;
  String smsCode;
  String verificationCode;


  Future<void> verifyPhone() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verificationCode = verId;
    };
    final PhoneCodeSent smscodeSent = (String verId, [int forceCodeResend]) {
      this.verificationCode = verId;
    };
    final PhoneVerificationCompleted verifiedSuccess =
        (AuthCredential credential) {
      print('Sucess');
    };
    final PhoneVerificationFailed notVerified = (AuthException exception) {
      print('${exception.message}');
    };

    /*await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: this.number,
        timeout: const Duration(seconds: 60),
        verificationCompleted: verifiedSuccess,
        verificationFailed: notVerified,
        codeSent: ,
        codeAutoRetrievalTimeout: autoRetrieve);
  }*/

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
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  auth.smsCode = value;
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
                    = value;
                  },
                  decoration: kDecoration.copyWith(hintText: 'Enter the OTP')),
            ),
            RoundedButton(
                title: text,
                colour: Colors.blueAccent,
                onPressed: () {
                  setState(() {
                    text = 'Lets Chat';
                    isvisible = true;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
*/