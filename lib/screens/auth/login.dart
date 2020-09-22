import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/Exceptions/api_failure_exception.dart';
import 'package:lagosarchdiocese/helpers/auth_layout.dart';
import 'package:lagosarchdiocese/providers/auth_provider.dart';
import 'package:lagosarchdiocese/screens/auth/signup.dart';
import 'package:lagosarchdiocese/ui_widgets/alt_auth_action.dart';
import 'package:lagosarchdiocese/ui_widgets/loading_button.dart';

import '../home.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email;
  String _password;
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: 'Login',
      children: <Widget>[
        Form(
          key: _formKey,
          child: LoginForm(
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
        Container(
          width: double.infinity,
          child: LoadingButton(
            text: 'Login',
            isLoading: _loading,
            action: () async {
              if (_formKey.currentState.validate()) {
                setState(() {
                  _loading = true;
                });
                FocusManager.instance.primaryFocus.unfocus();
                await Auth.authProvider(context)
                    .loginUser(_email, _password)
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
            children: <Widget>[
              AltAuthAction(
                defaultStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                leadingText: 'New? ',
                actionText: 'Sign up',
                actionStyle: TextStyle(decoration: TextDecoration.underline),
                onTap: () {
                  Navigator.of(context).pushNamed(SignUpScreen.id);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              HomeAction()
            ],
          ),
        )
      ],
    );
  }
}

class HomeAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
            HomePage.id, (Route<dynamic> route) => false);
      },
      child: Text(
        'Take me in',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final Function onEmailChange;
  final Function onPasswordChange;
  LoginForm({this.onEmailChange, this.onPasswordChange});
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
            }
            return null;
          },
        ),
      ],
    );
  }
}
