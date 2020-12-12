import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizmaker_app/services/auth.dart';
import 'package:quizmaker_app/views/home_for_anon.dart';
import 'package:quizmaker_app/views/signup.dart';
import 'package:quizmaker_app/widget/widgets.dart';

import 'home.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String email = '', password = '', error = '';
  AuthService _authService = AuthService();

  bool _isLoading = false;

  signIn() async {
    if (_formKey.currentState.validate()) {
      dynamic result = await _authService.signInEmailAndPass(email, password);
      if (result == null) {
        setState(() => error = 'Invalid email or password');
      } else if (result != null) {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : ListView(
              children: [
                Image.asset(
                  'images/logo.PNG',
                  scale: 3,
                ),
                SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          decoration: InputDecoration(hintText: "Email"),
                          onChanged: (val) {
                            email = val;
                          },
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        TextFormField(
                          obscureText: true,
                          validator: (val) => val.length < 6
                              ? 'Enter a password more than 6 characters'
                              : null,
                          decoration: InputDecoration(hintText: "Password"),
                          onChanged: (val) {
                            password = val;
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                            onTap: () {
                              signIn();
                            },
                            child:
                                blueButton(context: context, label: "Sign In")),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(fontSize: 15),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp()));
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 15,
                                      decoration: TextDecoration.underline),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _AnonymouslySignInSection(),
                        SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class _AnonymouslySignInSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnonymouslySignInSectionState();
}

class _AnonymouslySignInSectionState extends State<_AnonymouslySignInSection> {
  bool _success;
  String _userID;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            alignment: Alignment.center,
            child: ButtonTheme(
              minWidth: double.infinity,
              buttonColor: Colors.grey,
              child: RaisedButton(
                onPressed: () async {
                  _signInAnonymously();
                },
                child:
                    const Text('GUEST', style: TextStyle(color: Colors.white)),
              ),
            )),
      ],
    );
  }

  // Example code of how to sign in anonymously.
  void _signInAnonymously() async {
    final FirebaseUser user = (await _auth.signInAnonymously()).user;
    assert(user != null);
    assert(user.isAnonymous);
    assert(!user.isEmailVerified);
    assert(await user.getIdToken() != null);
    /*
    if (Platform.isIOS) {
      // Anonymous auth doesn't show up as a provider on iOS
      assert(user.providerData.isEmpty);
    } else if (Platform.isAndroid) {
      // Anonymous auth does show up as a provider on Android
      assert(user.providerData.length == 1);
      assert(user.providerData[0].providerId == 'firebase');
      assert(user.providerData[0].uid != null);
      assert(user.providerData[0].displayName == null);
      assert(user.providerData[0].photoUrl == null);
      assert(user.providerData[0].email == null);
    }
    */

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    setState(() {
      if (user != null) {
        _success = true;
        _userID = user.uid;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeForAnon()));
      } else {
        _success = false;
      }
    });
  }
}
