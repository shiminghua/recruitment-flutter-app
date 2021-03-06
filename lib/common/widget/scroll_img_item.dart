import 'package:flutter/material.dart';

class ScrollImageItem extends StatelessWidget {
  final String url;
  final String heroTag;
  VoidCallback onPressed;

  ScrollImageItem({Key key, this.url, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onPressed,
      child: new Hero(
        tag: heroTag,
        child: new Container(
          margin: EdgeInsets.only(right: 20.0),
          child: ClipRRect(
            borderRadius: new BorderRadius.circular(8.0),
            child: Image.network(url, width: 300, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
