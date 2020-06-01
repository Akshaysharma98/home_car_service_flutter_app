import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hcr/sidebar/menu_item.dart';
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
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,//sidebar is opened its true
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45, //sidebar is closed
          //14.9 min

          child: Row(
          children: <Widget>[
            Expanded(
              child:Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.blueAccent,
                child: Column(
                  children: <Widget>[
                    SizedBox(height:70,),
                    ListTile(
                        title:Text(
                          "Akshay",
                          style: TextStyle(color:Colors.white , fontSize: 30,fontWeight: FontWeight.w800,),
                        ),
                        subtitle: Text(
                          "akshaysharma@gmail.com",
                          style: TextStyle(color:Colors.blue[200] , fontSize: 20,),
                        ),             
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          radius: 40,
                        ),        
                    ),
                    Divider(
                      height: 64,
                      thickness: 0.5,
                      color: Colors.blue[100],
                      indent: 26,
                      endIndent: 26,
                    ),
                    MenuItem(
                      icon: Icons.home,
                      title: "Home",
                    ),
                    MenuItem(
                      icon: Icons.person,
                      title: "My Account",
                    ),
                    MenuItem(
                      icon: Icons.shopping_basket,
                      title: "My Orders",
                    ),
                    MenuItem(
                      icon: Icons.feedback,
                      title: "Feedback",
                    ),

                    Divider(
                      height: 64,
                      thickness: 0.5,
                      color: Colors.blue[100],
                      indent: 26,
                      endIndent: 26,
                    ),

                    MenuItem(
                      icon: Icons.exit_to_app,
                      title: "Logout",
                    ),

                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.99),//-0.9
              child: GestureDetector(

                onTap: () {
                  onIconPressed();
                },

                child: ClipPath(
                  clipper: CustomMenuClipper(),
                  child: Container(//yeh dusra part ha sidebar ka  
                    width: 35,//35
                    height: 110,//110
                    color: Colors.blueAccent,
                    alignment: Alignment.center,//centerLeft
                    child: AnimatedIcon(
                      progress: _animationController.view,
                      icon: AnimatedIcons.menu_close,
                      color: Colors.blue[200],
                      size: 25,
                    ),
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

class CustomMenuClipper extends  CustomClipper<Path> {
  @override
  Path getClip(Size  size) {
    Paint paint = Paint();
    paint.color= Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height/2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();    
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    
    return true;
  }

}