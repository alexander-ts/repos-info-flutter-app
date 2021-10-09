import 'package:flutter/material.dart';
import 'package:github_repos_info/components/repo_tile.dart';
import 'package:github_repos_info/github_api_manager.dart';
import 'package:github_repos_info/models/repo.dart';

/// Главный экран приложения - список репозиториев.
class HomeScreen extends StatefulWidget {
  // ignore: public_member_api_docs
  const HomeScreen({Key? key}) : super(key: key);

  /// Путь до экрана в навигаторе.
  static String routeName = '/';

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
              // ignore: prefer_final_locals
              var tiles = <Widget>[];

              if (!snapshot.hasError) {
                for (final repo in snapshot.data! as List<Repo>) {
                  tiles.add(RepoTile(repo));
                }
              }
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Github Repos Info'),
                ),
                body: RefreshIndicator(
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: tiles,
                  ),
                  onRefresh: () async {
                    setState(() {});
                  },
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}