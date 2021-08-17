import 'package:flutter/material.dart';
import 'package:github_repos_info/models/Repo.dart';

class RepoTile extends StatelessWidget
{
  final Repo repo;

  RepoTile(this.repo);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: null,
      dense: true,
      contentPadding: EdgeInsets.all(8),
      shape: Border.all(color: Colors.grey, width: 1.0, style: BorderStyle.solid),
      isThreeLine: true,
      leading: Text(repo.id.toString()),
      trailing: Text(repo.owner),
      title: Text(repo.name),
      subtitle: Text(repo.description),
    );
  }
}