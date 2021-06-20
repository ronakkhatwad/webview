import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff377eaa),
      body: SafeArea(
        child: Column(
          children: [
            (progress != 1.0)
                ? LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.purple))
                : null,
            Expanded(
              child: WebView(
                initialUrl: 'https://classmatrix.org/signin/',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController controller) {
                  controller.currentUrl().then((value) {
                    print(value);
                  });
                },
                onPageFinished: (finish) {
                  setState(() {
                    isLoading = false;
                  });
                },
                onProgress: (int progress) {
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
              ),
            ),
          ].where((Object o) => o != null).toList(),
        ),
        // InAppWebView(
        //     //initialFile: "https://classmatrix.org/signin/",
        //     initialUrlRequest: URLRequest(
        //       url: Uri.parse('https://classmatrix.org/signin/'),
        //     ),
        //     onWebViewCreated: (InAppWebViewController controller) {}),
      ),
    );
  }
}
