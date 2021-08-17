import 'package:flutter/material.dart';
import 'package:github_repos_info/GithubApiManager.dart';
import 'package:github_repos_info/components/RepoTile.dart';
import 'package:github_repos_info/models/Repo.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GithubApiManager apiManager = GithubApiManager();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder(
          future: apiManager.getRepositories(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Widget> tiles = [];

              if (!snapshot.hasError) {
                for (var repo in snapshot.data as List<Repo>)
                  tiles.add(RepoTile(repo));
              }
              return Scaffold(
                appBar: AppBar(
                  title: Text('Github Repos Info'),
                ),
                body: RefreshIndicator(
                  child: ListView(
                    padding: EdgeInsets.all(8),
                    children: tiles,
                  ),
                  onRefresh: () async {
                    setState(() => {});
                  },
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}