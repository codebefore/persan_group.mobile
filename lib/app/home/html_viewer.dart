import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persangroup_mobile/core/component/base_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HtmlViewerScreen extends StatefulWidget {
  const HtmlViewerScreen({super.key});

  @override
  State<HtmlViewerScreen> createState() => _HtmlViewerScreenState();
}

class _HtmlViewerScreenState extends State<HtmlViewerScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://persangroup.com.tr/en/contact-us/'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BaseText("contact".tr),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
