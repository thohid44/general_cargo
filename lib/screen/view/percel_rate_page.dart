import 'package:flutter/material.dart';
import 'package:general_cargo/Pages/Auth/view/home_screen.dart';
import 'package:general_cargo/Pages/Auth/view/login_page.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ParcelRatePage extends StatefulWidget {
  @override
  State<ParcelRatePage> createState() => _ParcelRatePageState();
}

class _ParcelRatePageState extends State<ParcelRatePage> {
  late WebViewController _webViewController;
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://cargo.blogtools.xyz')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://cargo.blogtools.xyz'));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("General Cargo"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(LoginPage());
                },
                icon: Icon(Icons.arrow_forward))
          ],
        ),
        body: WillPopScope(
          onWillPop: () async {
            if (await controller.canGoBack()) {
              controller.goBack();
              return false;
            } else {
              return true;
            }
          },
          child: WebViewWidget(
            controller: controller,
          ),
        ),
        
      ),
    );
  }
}
