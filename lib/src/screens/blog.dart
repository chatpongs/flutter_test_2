import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import '../widgets/image_card.dart';

class Blog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  List<dynamic> posts = List<dynamic>();
  _BlogState() {
    fetchData();
  }
  fetchData() async {
    final response = await get(
        'https://www.progaming.co.th/wp-json/wp/v2/posts?per_page=10&page=1');
    final body = response.body;
    final posts = jsonDecode(body);
    setState(() {
      this.posts = posts;
    });
  }

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: posts
                .map((post) => ImageCard(
                      id: post['id'].toString(),
                      title: post['title']['rendered'],
                      imageUri: 'assets/images/placeholder.png',
                      content: post['excerpt']['rendered'],
                      readMore: (id) {
                        Navigator.pushNamed(context, '/post/$id');
                      },
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
