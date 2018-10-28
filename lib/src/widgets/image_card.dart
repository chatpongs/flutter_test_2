import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String id;
  final String title;
  final String imageUri;
  final String content;
  final Function readMore;
  ImageCard({this.id, this.title, this.imageUri, this.content, this.readMore});

  build(context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            imageUri,
            fit: BoxFit.fitWidth,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.title,
                  overflow: TextOverflow.ellipsis,
                ),
                Divider(),
                Text(
                  content,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                ButtonBar(
                  children: <Widget>[
                    RaisedButton(
                      child: Text('อ่านต่อ'),
                      onPressed: () => readMore(id),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
