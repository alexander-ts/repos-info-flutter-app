import 'package:github_repos_info/models/Repo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class GithubApiManager {
  final Uri uri = Uri.https('api.github.com', '/orgs/mintrocket/repos');

  Future<List<Repo>> getRepositories() async {
    List<Repo> repos = [];
    print('[INFO] Getting repos from API.');
    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var jsonList = convert.jsonDecode(response.body) as List<dynamic>;
        for (var json in jsonList) repos.add(Repo.fromJson(json));
      } else
        throw Exception('Unexpected status code returned.');
    } catch (e) {
      print('[Error] Exception was thrown on API call: $e');
    }
    return repos;
  }
}