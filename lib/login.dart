import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isSignedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Container(
              padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
              child: Text(
                'Motiv8',
                style: TextStyle(
                    fontSize: 80.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'USERNAME',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          // hintText: 'EMAIL',
                          // hintStyle: ,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)
                          )
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'PASSWORD ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)
                          )
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 40.0),
                    GestureDetector(
                      onTap: () async {
                        try {
                          SignInResult res = await Amplify.Auth.signIn(
                            username: 'SwasP',
                            password: 'Prahit12345!',
                          );
                        } on AuthException catch (e) {
                          print(e.message);
                        }
                        Navigator.pushNamed(context, '/confirmSignUp');
                      },
                      child: Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.greenAccent,
                            color: Colors.green,
                            elevation: 7.0,
                            child: Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          )
                      ),
                    ),
                    SizedBox(height: 7.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't Have an Account?",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15.0
                          ),
                        ),
                        SizedBox(width: 5.0),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.green,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      color: CupertinoColors.lightBackgroundGray,
                      width: 100,
                      height: 2.5,
                    ),
                  ],
                )
            ),
          ]
      ),
    );
  }
}