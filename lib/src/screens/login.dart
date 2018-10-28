import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Container(
            width: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(
                  size: 100.0,
                ),
                SizedBox(height: 20.0),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Username',
                      helperText: 'Your email address or username'),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    helperText: 'Your secret password',
                  ),
                ),
                SizedBox(height: 20.0),
                RaisedButton.icon(
                  icon: Icon(Icons.assignment_ind),
                  label: Text('Login'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/blog');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
