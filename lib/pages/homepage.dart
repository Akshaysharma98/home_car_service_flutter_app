import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

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

            // Positioned(
            //   height: MediaQuery.of(context).size.height *0.18,
            //   width: MediaQuery.of(context).size.width *1.85,
            //     child: Icon(
            //     Icons.photo_library,
            //     color: Colors.blue,
            //     size: 36,
            //     ),
            // ),

            Positioned(
              top: 110,//100
              left:180,
              right: 50,
                child: Container(
                height: MediaQuery.of(context).size.height *0.28 + 2,
                decoration: BoxDecoration(
                  color: Colors.green[200],
                  borderRadius: BorderRadius.all(const Radius.circular(10)),
                ),
                
                child: Stack(
                  children: <Widget> [

                    Positioned(
                      top: 90,
                      left:12,                      
                      child: Text('Services',
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),

                    Positioned(
                      top: 30,
                      left: 20,
                      right: 20,
                        child: Container(
                        child: Image.asset('Images/car_parts.png',
                        height: 50,
                        width: 60,
                        
                        ),
                      ),
                    )


                  ],
                ),
                
              ),
            ),

            Positioned(
              top: 110,
              left:30,
              right: 200,
                child: Container(
                height: MediaQuery.of(context).size.height *0.13,
                // color: Colors.blue,
                decoration: BoxDecoration(
                  color: Colors.orange[200],
                  borderRadius: BorderRadius.all(const Radius.circular(10)),
                ),

                child: Stack(
                  children: <Widget> [

                    Positioned(
                      top: 40,
                      left:14,                      
                      child: Text('Packages',
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),

                    Positioned(
                      top: 10,
                      left: 2,
                      right: 2,
                        child: Container(
                        child: Image.asset('Images/pack.png',
                        height: 24,
                        width: 26,
                        
                        ),
                      ),
                    )


                  ],
                ),
              ),
            ),

            Positioned(
              top: 210,//200
              left:30,
              right: 200,
                child: Container(
                height: MediaQuery.of(context).size.height *0.13,
                // color: Colors.blue,
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.all(const Radius.circular(10)),
                ),

                child: Stack(
                  children: <Widget> [

                    Positioned(
                      top: 40,
                      left:14,                      
                      child: Text('Feedback',
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),

                    Positioned(
                      top: 10,
                      left: 2,
                      right: 2,
                        child: Container(
                        child: Image.asset('Images/feedback.png',
                        height: 24,
                        width: 26,
                        
                        ),
                      ),
                    )


                  ],
                ),
              ),
            ),

            Positioned(
              top: 310,
              left:60,
              child: Text('Our Work',
              style: TextStyle(
                fontSize:30,
                color:Colors.black,
                fontWeight: FontWeight.w600,
              ),
              ),
            ),

            Positioned(
              top: 360,
              left: 30,
              right: 30,
              child: Container(
                height: 180.0,
                width: 300.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(const Radius.circular(10)),
                ),
                child: Carousel(
                  images: [
                    ExactAssetImage("Images/porche_car_wash.jpg"),
                    ExactAssetImage("Images/engine_car_wash.jpg"),
                    ExactAssetImage("Images/audi_car_wash.jpg"),
                    ExactAssetImage("Images/bmw_car_wash.jpg"),
                    ExactAssetImage("Images/jaguar_car_wash.jpg"),
                    ExactAssetImage("Images/Ferrari_car_wash.jpg"),
                    ExactAssetImage("Images/lam_car_wash.jpg"),
                    ExactAssetImage("Images/mustang_car_wash.jpg"),
                  ],
                      dotSize: 4.0,
                      dotSpacing: 15.0,
                      dotColor: Colors.lightGreenAccent,
                      indicatorBgPadding: 5.0,
                      dotBgColor: Colors.transparent.withOpacity(0.5),
                      borderRadius: true,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}