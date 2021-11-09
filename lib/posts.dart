import 'package:flutter/material.dart';
import 'package:http_flutter/http_service.dart';
import 'package:http_flutter/page_detail.dart';
import 'package:http_flutter/post_model.dart';

class PostsPages extends StatelessWidget {
  PostsPages({Key? key}) : super(key: key);
  final HttpService httpService = HttpService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: httpService.getPosts(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData) {
              List<Post>? posts = snapshot.data;

              return ListView(
                children: posts!.map((Post post) => ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.id.toString(),),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PageDetail(post: post,),),),
                    ),
                  )
                  .toList()
              );
            }

            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
