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
    return MaterialApp(
        title: 'Flutter Home Page',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyOverlayWidget(child: const MyHomePage(title: 'Flutter Home Page')),
    );
  }
}
