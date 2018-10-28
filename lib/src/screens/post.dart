import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Post extends StatefulWidget {
  final String id;
  Post({@required this.id});
  @override
  State<StatefulWidget> createState() => _PostState();
}

class _PostState extends State<Post> {
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Single Post'),
      ),
      body: FutureBuilder(
        future:
            get('https://www.progaming.co.th/wp-json/wp/v2/posts/${widget.id}'),
        builder: (context, AsyncSnapshot<Response> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          final Map<String, dynamic> body = jsonDecode(snapshot.data.body);
          final String title = body['title']['rendered'];
          final String content = body['content']['rendered'];
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/placeholder.png',
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text(content),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
