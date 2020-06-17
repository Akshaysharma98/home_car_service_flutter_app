import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hcr/pages/homepage.dart';
import 'package:hcr/pages/myorders.dart';
import 'package:hcr/pages/packages.dart';
import 'package:hcr/sidebar/sidebar_layout.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int _currentIndex ;
  int _initialvalue = 0;
  _onTap(int index) {
        
        setState(() {
                  _currentIndex = index;
      
            if(_currentIndex == 0){
                  debugPrint('page not found0');
                  Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new SideBarLayout();
                  },),);                  
                }
            else if(_currentIndex == 1){
                  debugPrint('page not found1');
                  Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new MyOrdersPage();
                  },),);
                }
            else if(_currentIndex == 2){
                  debugPrint('page not found2');
                  Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new PackagesPage();
                  },),);
                }
            else{
                  debugPrint('page not found');

                }
        });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.blueAccent,
          backgroundColor: Colors.grey[50],
          buttonBackgroundColor: Colors.blue[300],
          height: 55.0,
          index: _initialvalue,
          items: <Widget> [
            Icon(Icons.home,size: 25,color: Colors.black,),
            Icon(Icons.shopping_cart,size: 25,color: Colors.black,),
            Icon(Icons.style,size: 25,color: Colors.black,),
            
          ],
          // onTap: (index) {
          //     debugPrint("Current index is $index");
          //     _currentIndex = index;
          //     setState(() {

          //       if(_currentIndex == 0){
          //         debugPrint('page not found0');
          //         HomePage();
          //       }else if(_currentIndex == 1){
          //         debugPrint('page not found1');
          //         MyOrdersPage();
          //       }else if(_currentIndex == 2){
          //         debugPrint('page not found2');
          //         PackagesPage();
          //       }else{
          //         debugPrint('page not found');

          //       }
                
          //     });
          //   },
          onTap: _onTap,
          
        ),      
    );
  }
}