import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {

  /// Indicates whether a long running task is in progress
  bool inProgress;

  /// This widget should be the main screen that should
  /// be shrouded in the background during a long running task
  Widget child;

  MyProgressIndicator({required this.inProgress, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: child
        ),

        if(inProgress)
          Container( // Shrouding layout to prevent user interactions
            color: Colors.black.withOpacity(0.5),
            alignment: Alignment.center,
            child: Container(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}
