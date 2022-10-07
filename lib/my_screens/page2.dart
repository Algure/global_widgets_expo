import 'package:flutter/material.dart';
import 'package:global_widgets_expo/my_widgets/my_overlay_widget.dart';
import 'package:global_widgets_expo/my_widgets/my_progress_indicator.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAGE 2'),
      ),
      body: MyProgressIndicator(
        inProgress: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'This is another page to confirm overlay is consistent across screens',
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showOverlay,
        tooltip: 'Increment',
        child: const Icon(Icons.remove_red_eye_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _showOverlay() {
    MyOverlayWidget.setTimedNotifierValue(true);
  }
}
