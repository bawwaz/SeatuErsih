import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';
class PaymentWebView extends StatelessWidget {
  final String? url;

  PaymentWebView({this.url}); // Update constructor

  @override
  Widget build(BuildContext context) {
    final WebViewController controller = WebViewController();
    final loadUrl = url != null ? Uri.parse(url!) : null; // Handle optional URL

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: WebViewWidget(
        controller: controller..loadRequest(loadUrl!), // Use optional URL loader
      ),
    );
  }
}



