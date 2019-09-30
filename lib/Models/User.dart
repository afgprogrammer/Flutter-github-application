class User {
  final String login;
  final String avatar_url;
  final String html_url;

  User(this.login, this.avatar_url, this.html_url);

  Map toJson() => {
    'login': login,
    'avatar_url': avatar_url,
    'html_url': html_url
  };

  User.fromJson(Map json) :
  login = json['login'],
  avatar_url = json['avatar_url'],
  html_url = json['html_url'];
}
