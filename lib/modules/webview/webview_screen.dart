import 'package:easy_web_view2/easy_web_view2.dart';
import 'package:flutter/material.dart';

class WebViewScreen extends StatelessWidget {
  String url;
  WebViewScreen(this.url, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: EasyWebView(
        onLoaded: () {},
        src: url,
      ),
    );
  }
}
