import 'package:flutter/material.dart';
import 'package:github_repos_info/screens/description_screen.dart';
import 'package:github_repos_info/screens/home_screen.dart';

void main() {
  runApp(const App());
}

// ignore: public_member_api_docs
class App extends StatelessWidget {
  // ignore: public_member_api_docs
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
          DescriptionScreen.routeName: (BuildContext context) =>
              const DescriptionScreen()
        },
        title: 'Github Repos',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ));
  }
}