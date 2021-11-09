import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_flutter/post_model.dart';

class HttpService {
  var url = Uri.https('jsonplaceholder.typicode.com', '/posts');

  Future<void> deletePost(int id) async {
    final response = await http.delete(Uri.https('jsonplaceholder.typicode.com', '/posts/$id'));

    if (response.statusCode == 200) {
      // ignore: avoid_print
      print('Delete');
    }
  }

  Future<List<Post>> getPosts() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Post> posts = body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw "Can't get posts.";
    }
  }
}
