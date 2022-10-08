import 'package:flutter/material.dart';

import 'my_screens/home_page.dart';
import 'my_widgets/my_overlay_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyOverlayWidget(
      child: MaterialApp(
          title: 'Flutter Home Page',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Flutter Home Page'),
      ),
    );
  }
}
