import 'package:flutter/material.dart';
import 'package:quizmaker_app/services/auth.dart';
import 'package:quizmaker_app/views/signin.dart';
import 'package:quizmaker_app/widget/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String name, email = '', password = '';
  String error = '';
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  signUp() async {
    if (_formKey.currentState.validate()) {
      dynamic result =
          await _authService.signUpWithEmailAndPassword(email, password);
      if (result == null) {
        setState(() => error = 'please supply a valid email');
      } else if (result != null) {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignIn()));
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
                          validator: (val) {
                            return val.isEmpty ? "Enter Name" : null;
                          },
                          decoration: InputDecoration(hintText: "Name"),
                          onChanged: (val) {
                            name = val;
                          },
                        ),
                        SizedBox(
                          height: 6,
                        ),
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
                              // List<String> str = [
                              //   'You have signed up!',
                              // ];
                              // final snackBar = SnackBar(content: Text(str[0]));
                              // Scaffold.of(context).showSnackBar(snackBar);
                              signUp();
                            },
                            child:
                                blueButton(context: context, label: "Sign Up")),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(fontSize: 15),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignIn()));
                                },
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                      fontSize: 15,
                                      decoration: TextDecoration.underline),
                                )),
                          ],
                        ),
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
