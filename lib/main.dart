import 'package:flutter/material.dart';
import 'package:flutter_gif_trail/Setup/loading.dart';
import 'package:flutter_gif_trail/models/user.dart';
import 'package:flutter_gif_trail/screens/wrapper.dart';
import 'package:flutter_gif_trail/services/auth.dart';
import 'package:provider/provider.dart';
import 'Setup/SignIn.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/signup': (context) => LoginPage(),
      //'view': (context) => ViewProfile(),
    },
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Authservice().user,
      child: Container(
        child: Wrapper(),
      ),
    );
  }
}


