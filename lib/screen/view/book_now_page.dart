import 'package:flutter/material.dart';
import 'package:general_cargo/Pages/Auth/view/home_screen.dart';
import 'package:general_cargo/Pages/Auth/view/login_page.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookNowPage extends StatefulWidget {
  @override
  State<BookNowPage> createState() => _BookNowPageState();
}

class _BookNowPageState extends State<BookNowPage> {
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
          if (request.url.startsWith('https://gctrack.blogtools.xyz')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://cargo.blogtools.xyz'));
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
        
        
    
    );
  }
}
