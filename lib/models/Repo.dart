/// Модель Репозиторий.
class Repo {
  /// Конструктор из JSON.
  Repo.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? json['id'] as int : 0;
    name = json['name'] != null ? json['name'] as String : '';
    // ignore: avoid_dynamic_calls
    owner = json['owner'] != null ? json['owner']['login'] as String : '';
    htmlUrl = json['html_url'] != null ? json['html_url'] as String : '';
    description =
        json['description'] != null ? json['description'] as String : '';
  }

  /// ID репозитория.
  int id = 0;
  /// Название репозитория.
  String name = '';
  /// Владелец репозитория.
  String owner = '';
  /// Ссылка на репозиторий.
  String htmlUrl = '';
  /// Описание репозитория.
  String description = '';
}
