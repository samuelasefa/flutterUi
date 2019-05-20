import 'package:flutter/material.dart';

class Textpage extends StatelessWidget {
  final String pageText;

  Textpage(this.pageText);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(pageText),),
      body: new Center(
        child: new Text(pageText)
      ),
    );
  }
}