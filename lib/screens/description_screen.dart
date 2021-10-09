import 'package:flutter/material.dart';
import 'package:github_repos_info/models/repo.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Экран - описание репозитория.
class DescriptionScreen extends StatelessWidget {
  // ignore: public_member_api_docs
  const DescriptionScreen({Key? key}) : super(key: key);

  /// Путь для экрана в навигаторе.
  static String routeName = '/description';

  @override
  Widget build(BuildContext context) {
    final currentRepo = ModalRoute.of(context)!.settings.arguments! as Repo;
    return Scaffold(
      appBar: AppBar(
        title: Text(currentRepo.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
              onPressed: () => Share.share(currentRepo.htmlUrl),
              icon: const Icon(Icons.share))
        ],
      ),
      body: WebView(
        initialUrl: currentRepo.htmlUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
