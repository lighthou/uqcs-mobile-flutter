import 'package:flutter/material.dart';
import 'package:uqcs_mobile_flutter/sign_in.dart';
import 'package:uqcs_mobile_flutter/signup_1.dart';

import 'first_screen.dart';
import 'google_sign_in_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[900],
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/uqcs_logo.png'),
              SizedBox(height: 50),
              ImageButton(
                image: Image(
                  image: AssetImage('assets/images/google_logo.png'),
                  height: 35.0,
                ),
                text: 'Sign in with Google',
                onPressed: () {
                  signInWithGoogle().whenComplete(() {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return OnboardingScreen();
                        },
                      ),
                    );
                  });
                },
              ),
              ImageButton(
                text: 'I dont want to Sign In',
                onPressed: () {
                  signInWithGoogle().whenComplete(() {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return MyWidget();
                        },
                      ),
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
