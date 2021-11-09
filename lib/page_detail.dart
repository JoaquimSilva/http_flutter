import 'package:flutter/material.dart';
import 'package:http_flutter/http_service.dart';
import 'package:http_flutter/post_model.dart';

class PageDetail extends StatelessWidget {
  PageDetail({Key? key, required this.post}) : super(key: key);

  final Post post;
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: () async {
          await httpService.deletePost(post.id);
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: const Text('Title'),
                  subtitle: Text(post.title),
                ),
                ListTile(
                  title: const Text('ID'),
                  subtitle: Text('${post.id}'),
                ),
                ListTile(
                  title: const Text('Body'),
                  subtitle: Text(post.body),
                ),
                ListTile(
                  title: const Text('User Id'),
                  subtitle: Text('${post.userid}'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
