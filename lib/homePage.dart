import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<void> _getUser() async {
    try {
      var res = await Amplify.Auth.fetchUserAttributes();
      res.forEach((element) {
        print('key: ${element.userAttributeKey}; value: ${element.value}');
      });
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextButton(
            child: Text('HEY BUDDY GO TO ME AFTER SIGN UP'),
            onPressed: () {
              _getUser();
            },
          ),
        ),
      ),
    );
  }
}
