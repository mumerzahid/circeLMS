// This Widget is use in Dashboard FeedsPart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DashboardFeeds extends StatelessWidget {
  final String htmlView;
  final String title;

  const DashboardFeeds({Key key, this.htmlView , this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            maxLines: 2,
            style: TextStyle(
              fontFamily: 'Open Sans',
              fontSize: 14,
              color: Colors.black
                ) ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            // width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.all(3),
              child: Html(
                data: htmlView
                // data: model
                //     .feedlist[
                // index]
                //     .content,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
