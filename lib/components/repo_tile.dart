import 'package:flutter/material.dart';
import 'package:github_repos_info/models/repo.dart';
import 'package:github_repos_info/screens/description_screen.dart';

/// Виджет - карточка репозитория - элемент списка.
class RepoTile extends StatelessWidget {
  /// Конструктор карточки репозитория.
  const RepoTile(this.repo, {Key? key}) : super(key: key);

  /// Репозиторий.
  final Repo repo;


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        onTap: () => Navigator.of(context)
            .pushNamed(DescriptionScreen.routeName, arguments: repo),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
                color: Colors.grey, width: 0.8),),
        leading: const SizedBox(
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
              const Padding(padding: EdgeInsets.all(6)),
              Text(repo.description),
              const Padding(padding: EdgeInsets.all(8)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('ID: ${repo.id.toString()}'), Text(repo.owner)],
              )
            ]),
      ),
    );
  }
}
