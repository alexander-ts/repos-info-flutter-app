import 'dart:convert' as convert;

import 'package:github_repos_info/models/repo.dart';
import 'package:http/http.dart' as http;

/// Класс для работы с API Github.
class GithubApiManager {
  ///URI до страницы команды на Github.
  final Uri uri = Uri.https('api.github.com', '/orgs/flutter/repos');

  /// Метод получения списка репозиториев.
  Future<List<Repo>> getRepositories() async {
    final repos = <Repo>[];
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonList = convert.jsonDecode(response.body) as List<dynamic>;
        for (final json in jsonList) {
          repos.add(Repo.fromJson(json as Map<String, dynamic>));
        }
      } else {
        throw Exception('Unexpected status code returned.');
      }
    } catch (e) {
      // ignore: avoid_print
      print('[Error] Exception was thrown on API call: $e');
    }
    return repos;
  }
}