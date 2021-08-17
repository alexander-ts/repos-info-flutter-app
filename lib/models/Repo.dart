class Repo {
  int id = 0;
  String name = '';
  String owner = '';
  String htmlUrl = '';
  String description = '';

  Repo.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? json['id'] : "";
    name = json['name'] != null ? json['name'] : "";
    owner = json['owner'] != null ? json['owner']['login'] : "";
    htmlUrl = json['html_url'] != null ? json['html_url'] : "" ;
    description = json['description'] != null ? json['description'] : "";
  }
}