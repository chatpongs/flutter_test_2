import 'package:flutter/material.dart';
import './screens/login.dart';
import './screens/blog.dart';
import './screens/post.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        buttonColor: Colors.pinkAccent,
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
        fontFamily: 'Kanit',
      ),
      routes: {
        '/': (context) => Login(),
        '/blog': (context) => Blog(),
      },
      onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) {
              final path = settings.name.split('/');
              if (path[0] != '') return null;
              if (path[1] == 'post') {
                return Post(
                  id: path[2],
                );
              }
            },
          ),
    );
  }
}
