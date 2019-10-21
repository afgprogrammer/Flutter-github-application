import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:github_following/Models/User.dart';
import 'package:github_following/Requests/github_request.dart';

class FollowingProvider with ChangeNotifier{
  List<User> users;
  bool loading = false;

  Future<bool> fetchList(username) async {
    setLoading(true);

    await Github(username).fetchFollowing().then((following) {
      setLoading(false);

      if (following.statusCode == 200) {
        Iterable list = json.decode(following.body);
        setList(list.map((model) => User.fromJson(model)).toList());
        setLoading(false);
      } else {
//        Map<String, dynamic> result = json.decode(following.body);
        setLoading(false);
      }
    });

    return isList();
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }

  void setList(value) {
    users = value;
    notifyListeners();
  }

  List getList() {
    return users;
  }


  bool isList() {
    return users != null ? true : false;
  }
}