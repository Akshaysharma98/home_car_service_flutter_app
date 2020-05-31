import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SideBar extends StatefulWidget {

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSideBarOpenedStreamController;
  Stream<bool> isSideBarOpenedStream;
  StreamSink<bool> isSideBarOpenedSink;
  
  final _animationduration = const Duration(milliseconds : 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationduration);
    //initializing streamcontroller
    isSideBarOpenedStreamController = PublishSubject<bool>();
    isSideBarOpenedStream = isSideBarOpenedStreamController.stream;
    isSideBarOpenedSink = isSideBarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSideBarOpenedStreamController.close();
    isSideBarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus =_animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if(isAnimationCompleted){
      isSideBarOpenedSink.add(false); 
      _animationController.reverse();
    }else{
      isSideBarOpenedSink.add(true); 
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSideBarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationduration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : 0,//sidebar is opened its true
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45, //sidebar is closed
          //14.9 min

          child: Row(
          children: <Widget>[
            Expanded(
              child:Container(
                color: Colors.blueAccent,
              ),
            ),
            Align(
              alignment: Alignment(0, -0.9),
              child: GestureDetector(

                onTap: () {
                  onIconPressed();
                },

                child: Container(//yeh background ha homepage ka 
                  width: 35,
                  height: 110,
                  color: Colors.blueAccent,
                  alignment: Alignment.centerLeft,
                  child: AnimatedIcon(
                    progress: _animationController.view,
                    icon: AnimatedIcons.menu_close,
                    color: Colors.blue[200],
                    size: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
      },
    );
  }
}