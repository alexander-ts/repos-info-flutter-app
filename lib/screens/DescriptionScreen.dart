import 'package:flutter/material.dart';
import 'package:github_repos_info/models/Repo.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:share_plus/share_plus.dart';

class DescriptionScreen extends StatelessWidget {
  static String routeName = '/description';

  @override
  Widget build(BuildContext context) {
    var currentRepo = ModalRoute.of(context)!.settings.arguments as Repo;
    return Scaffold(
      appBar: AppBar(
        title: Text(currentRepo.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
              onPressed: () => Share.share(currentRepo.htmlUrl),
              icon: Icon(Icons.share))
        ],
      ),
      body: WebView(
        initialUrl: currentRepo.htmlUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
