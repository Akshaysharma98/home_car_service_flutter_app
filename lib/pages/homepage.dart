import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Stack(
          children: <Widget> [
            Align(
              alignment: Alignment(-0.38, - 0.88),
              child: Container(
                child:Text("Explore",
                style: TextStyle(
                  color:Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),

            Positioned(
              height: MediaQuery.of(context).size.height *0.18,
              width: MediaQuery.of(context).size.width *1.85,
                child: Icon(
                Icons.photo_library,
                color: Colors.blue,
                size: 36,
                ),
            ),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                primary: false,
                children: <Widget>[
                  FlatButton(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Services",
                        style: TextStyle(
                        color:Colors.black ,
                         fontSize: 20),
                         ),
                         
                      ],
                    ),
                    ),
                  FlatButton(
                    
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Packages",
                        style: TextStyle(
                        color:Colors.black ,
                         fontSize: 20),
                         ),
                         
                      ],
                    ),
                    ),
                    FlatButton(
                    
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Feedback",
                        style: TextStyle(
                        color:Colors.black ,
                         fontSize: 20),
                         ),
                         
                      ],
                    ),
                    ),
                  
                ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}