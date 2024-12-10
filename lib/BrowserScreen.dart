import 'package:flutter/material.dart';
import 'package:web_browser/web_browser.dart';

class BrowserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Demo Trình duyệt'),
        ),
        // Use a FutureBuilder to display a loading spinner while waiting for the
        // VideoPlayerController to finish initializing.
        body: Browser(
            initialUriString: 'https://vietnamnet.vn/',
            controller: BrowserController(
              // "User-Agent" HTTP header.
              userAgent: 'Your user agent',

              // Can user zoom into the content? Default is true.
            )));
  }
}
