import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/Exceptions/api_failure_exception.dart';
import 'package:lagosarchdiocese/helpers/auth_layout.dart';
import 'package:lagosarchdiocese/providers/auth_provider.dart';
import 'package:lagosarchdiocese/screens/auth/login.dart';
import 'package:lagosarchdiocese/ui_widgets/alt_auth_action.dart';
import 'package:lagosarchdiocese/ui_widgets/loading_button.dart';

import '../home.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'signup_screen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _email;
  String _password;
  String _name;
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: 'Sign up',
      children: <Widget>[
        Form(
          key: _formKey,
          child: SignUpForm(
            onNameChange: (value) {
              setState(() {
                _name = value;
              });
            },
            onEmailChange: (value) {
              setState(() {
                _email = value;
              });
            },
            onPasswordChange: (value) {
              setState(() {
                _password = value;
              });
            },
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          'By clicking Sign up, you agree to our terms of use',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 15.0),
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          width: double.infinity,
          child: LoadingButton(
            text: 'Sign up',
            isLoading: _loading,
            action: () async {
              if (_formKey.currentState.validate()) {
                setState(() {
                  _loading = true;
                });
                FocusManager.instance.primaryFocus.unfocus();
                await Auth.authProvider(context)
                    .registerUser(_name, _email, _password)
                    .then((_) => setState(() {
                          _loading = false;
                        }))
                    .catchError((error) {
                  setState(() {
                    _loading = false;
                  });
                  throw ApiFailureException(error);
                });
                Navigator.of(context).pushNamedAndRemoveUntil(
                    HomePage.id, (Route<dynamic> route) => false);
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 14.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AltAuthAction(
                    defaultStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                    leadingText: 'Already have an account? ',
                    actionText: 'Login',
                    actionStyle:
                        TextStyle(decoration: TextDecoration.underline),
                    onTap: () {
                      Navigator.of(context).pushNamed(LoginScreen.id);
                    },
                  ),
                ],
              ),
              HomeAction(),
            ],
          ),
        )
      ],
    );
  }
}

class SignUpForm extends StatelessWidget {
  final Function onNameChange;
  final Function onEmailChange;
  final Function onPasswordChange;
  SignUpForm({this.onEmailChange, this.onNameChange, this.onPasswordChange});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            hintText: 'Email',
            labelText: 'Email',
            contentPadding: EdgeInsets.all(7.0),
            labelStyle: TextStyle(color: Colors.black),
            errorStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          onChanged: (value) {
            onEmailChange(value);
          },
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        SizedBox(
          height: 15.0,
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            hintText: 'Name',
            labelText: 'Name',
            contentPadding: EdgeInsets.all(7.0),
            labelStyle: TextStyle(color: Colors.black),
            errorStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          onChanged: (value) {
            onNameChange(value);
          },
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        SizedBox(
          height: 15.0,
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'Password (Minimum 6 characters)',
            labelText: 'Password',
            contentPadding: EdgeInsets.all(7.0),
            labelStyle: TextStyle(color: Colors.black),
            errorStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          onChanged: (value) {
            onPasswordChange(value);
          },
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            } else if (value.length < 6) {
              return 'Password should be at least six characters';
            }
            return null;
          },
        ),
      ],
    );
  }
}
