import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class ConfirmSignUp extends StatefulWidget {
  const ConfirmSignUp({Key? key}) : super(key: key);

  @override
  _ConfirmSignUpState createState() => _ConfirmSignUpState();
}

class _ConfirmSignUpState extends State<ConfirmSignUp> {

  final myController = TextEditingController();

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
                      controller: myController,
                      decoration: InputDecoration(
                          labelText: 'Verification Code',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)
                          )
                      ),
                    ),
                    SizedBox(height: 10.0),
                    GestureDetector(
                      onTap: () async {
                        try {
                          SignInResult res = await Amplify.Auth.confirmSignIn(
                              confirmationValue: myController.text
                          );
                          Navigator.pushNamed(context, '/');
                        } on AuthException catch (e) {
                          print(e.message);
                        }

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
                                'Confirm Code',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          )
                      ),
                    ),
                  ],
                )
            ),
          ]
      ),
    );;
  }
}
