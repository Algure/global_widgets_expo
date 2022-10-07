import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyOverlayWidget extends StatelessWidget {
  final MaterialApp materialApp;

  static final  ValueNotifier<bool> notifier = ValueNotifier(false);

  MyOverlayWidget({Key? key,
    required this.materialApp,
  }) : super(key: key);

  static setNotifierValue(bool value){
    notifier.value = value;
    notifier.notifyListeners();
  }


  static setTimedNotifierValue(bool value) async {
    final oldValue = notifier.value;
    notifier.value = value;
    notifier.notifyListeners();
    await Future.delayed(Duration(seconds: 3), (){
      setNotifierValue(oldValue);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Overlay(
      initialEntries: [
        OverlayEntry(builder: (context){
          return materialApp;
        }),

        if(notifier.value)
        OverlayEntry(builder: (context){
          return Container( // Shrouding layout to prevent user interactions
            color: Colors.black.withOpacity(0.5),
            alignment: Alignment.center,
            child: Container(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(),
            ),
          );
        }),

      ],
    );
  }
}
