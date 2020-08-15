import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class LoadWebView extends StatelessWidget {
  final String data;
  const LoadWebView({this.data});
  @override
  Widget build(BuildContext context) {
    return HtmlWidget(data);
  }
}
