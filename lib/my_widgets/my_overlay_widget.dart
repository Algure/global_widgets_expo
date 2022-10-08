import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class MyOverlayWidget extends StatefulWidget {
  final Widget child;

  static final  ValueNotifier<bool> notifier = ValueNotifier(false);

  MyOverlayWidget({Key? key,
    required this.child,
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
  State<MyOverlayWidget> createState() => _MyOverlayWidgetState();
}

class _MyOverlayWidgetState extends State<MyOverlayWidget> {



  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Overlay(
        initialEntries: [
          OverlayEntry(builder: (context){
            return widget.child;
          }),

          if(MyOverlayWidget.notifier.value)
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
              }
            ),
        ],
      ),
    );
  }

  @override
  void initState() {
    MyOverlayWidget.notifier.addListener(_rebuildByNotifier);
  }

  void _rebuildByNotifier() {
    print('MyOverlayWidget.notifier.value: ${MyOverlayWidget.notifier.value}');
    setState(() {

    });
  }
}


