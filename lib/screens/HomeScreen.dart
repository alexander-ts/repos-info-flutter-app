import 'package:flutter/material.dart';
import 'package:github_repos_info/GithubApiManager.dart';
import 'package:github_repos_info/models/Repo.dart';

class HomeScreen extends StatelessWidget 
{
  static String routeName = "/";
  GithubApiManager apiManager = GithubApiManager(); 

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiManager.getRepositories(),
      builder: (context, snapshot) {
        if (snapshot.hasData)
        {
          List<Widget> tiles = [];
          for (var repo in snapshot.data as List<Repo>)
            tiles.add(Text(repo.name));
          return ListView(
            children: tiles,
          );
        }
        else
        {
          return Center(child: CircularProgressIndicator());
        }
      });
  }
}