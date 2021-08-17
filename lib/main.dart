import 'package:flutter/material.dart';
import 'package:github_repos_info/screens/DescriptionScreen.dart';
import 'package:github_repos_info/screens/HomeScreen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          HomeScreen.routeName: (BuildContext context) => HomeScreen(),
          DescriptionScreen.routeName: (BuildContext context) =>
              DescriptionScreen()
        },
        title: 'Github Repos',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ));
  }
}