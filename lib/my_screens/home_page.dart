
import 'package:flutter/material.dart';
import 'package:global_widgets_expo/my_screens/page2.dart';
import 'package:global_widgets_expo/my_widgets/my_overlay_widget.dart';
import 'package:global_widgets_expo/my_widgets/my_progress_indicator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MyProgressIndicator(
        inProgress: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              FloatingActionButton(
                onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>Page2())),
                tooltip: 'Next page',
                child: const Icon(Icons.navigate_next),
              ), // This trail
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
