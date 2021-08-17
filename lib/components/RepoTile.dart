import 'package:flutter/material.dart';
import 'package:github_repos_info/models/Repo.dart';
import 'package:github_repos_info/screens/DescriptionScreen.dart';

class RepoTile extends StatelessWidget {
  final Repo repo;

  RepoTile(this.repo);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        onTap: () => Navigator.of(context)
            .pushNamed(DescriptionScreen.routeName, arguments: repo),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
                color: Colors.grey, width: 0.8, style: BorderStyle.solid)),
        leading: Container(
          height: double.infinity,
          child: Image(
            image: AssetImage(
              'assets/images/GitHub-Mark-32px.png',
            ),
            alignment: Alignment.bottomCenter,
          ),
        ),
        title: Text(repo.name),
        subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(6)),
              Text(repo.description),
              Padding(padding: EdgeInsets.all(8)),
              Row(
                children: [Text('ID: ${repo.id.toString()}'), Text(repo.owner)],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              )
            ]),
      ),
    );
  }
}
