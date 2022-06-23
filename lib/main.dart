import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:motiv8/amplifyconfiguration.dart';
import 'package:motiv8/confirmSignUp.dart';
import 'package:motiv8/homePage.dart';
import 'package:motiv8/login.dart';
import 'package:motiv8/signup.dart';


void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Main();
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  bool _amplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    if (!_amplifyConfigured) {
      try {
        // Add the following line to add Auth plugin to your app.

        await Amplify.addPlugin(AmplifyAuthCognito());

        // call Amplify.configure to use the initialized categories in your app
        await Amplify.configure(amplifyconfig);
      } on Exception catch (e) {
        print('An error occurred configuring Amplify: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
          // title: 'Flutter Demo',
          // theme: ThemeData(
          //   primarySwatch: Colors.blue,
          // ),
          // // home: LoginScreen()
          // initialRoute: '/login',
          // routes: {
          //   '/': (context) => HomePage(),
          //   '/login': (context) => LoginScreen(),
          //   '/signup': (context) => SignUp(),
          //   '/confirmSignUp': (context) => ConfirmSignUp(),
          // }
        builder: Authenticator.builder(),
        home: mainPage(),
      ),
    );
  }
}

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {

  String email = '';

  @override
  void initState() {
    super.initState();
    _fetchUser();
    Amplify.Hub.listen([HubChannel.Auth], (hubEvent) {
      switch(hubEvent.eventName) {
        case 'SIGNED_IN':
          print('USER IS SIGNED IN');
          _fetchUser();
          break;
        case 'SIGNED_OUT':
          print('USER IS SIGNED OUT');
          break;
        case 'SESSION_EXPIRED':
          print('SESSION HAS EXPIRED');
          break;
        case 'USER_DELETED':
          print('USER HAS BEEN DELETED');
          break;
      }
    });
  }

  Future<void> _fetchUser() async {
      try {
        var res = await Amplify.Auth.fetchUserAttributes();
        res.forEach((element) {
          if (element.userAttributeKey == CognitoUserAttributeKey.email) {
            email = element.value;
          }
        });
      } on AuthException catch (e) {
        print(e.message);
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text('You are logged in!'),
            Text(email),
            TextButton(
                onPressed: () async {
                  try {
                    await Amplify.Auth.signOut(options: SignOutOptions(globalSignOut: true));
                  } on AmplifyException catch (e) {
                    print(e.message);
                  }
                },
                child: Text("SIGN OUT PLEASE WORK")
            )
          ],
        ),
      ),
    );
  }
}

