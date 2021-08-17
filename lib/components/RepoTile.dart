import 'package:flutter/material.dart';
import 'package:github_repos_info/models/Repo.dart';
import 'package:github_repos_info/screens/DescriptionScreen.dart';

class RepoTile extends StatelessWidget {
  final Repo repo;

  RepoTile(this.repo);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context)
          .pushNamed(DescriptionScreen.routeName, arguments: repo),
      dense: true,
      contentPadding: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
              color: Colors.grey, width: 0.8, style: BorderStyle.solid)),
      isThreeLine: true,
      leading: Text(repo.id.toString()),
      trailing: Text(repo.owner),
      title: Text(repo.name),
      subtitle: Text(repo.description),
    );
  }
}