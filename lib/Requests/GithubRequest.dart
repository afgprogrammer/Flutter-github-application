import 'package:http/http.dart' as http;

class Github {
  final String userName;
  final String url = 'api.github.com';
  static String token = 'Your_github_client_id';

  Github(this.userName);

  Future<http.Response> fetchUser() {
    return http.get(Uri.https(url, 'users/' + userName), headers: {
      "Authorization": "Bearer $token",
    });
  }

  Future<http.Response> fetchFollowing() {
    return http.get(Uri.https(url, 'users/' + userName + '/followers'), headers: {
      "Authorization": "Bearer $token",
    });
  }
}
