import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hcr/pages/packages.dart';
import 'homepage.dart';
import 'myorders.dart';
import 'packages.dart';


class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with SingleTickerProviderStateMixin {

  List<Widget> _tabList = [HomePage(), MyOrdersPage(), PackagesPage()];
  List<Widget> _iconList = [

          Icon(Icons.home,size: 25,color: Colors.black,),
          Icon(Icons.shopping_cart,size: 25,color: Colors.black,),
          Icon(Icons.style,size: 25,color: Colors.black,),
  ];
  TabController _tabController;

  @override

  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: _tabList.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: TabBarView(
                children: _tabList,
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
          ),
      ),
            bottomNavigationBar: CurvedNavigationBar(
              color: Colors.blueAccent,
              backgroundColor: Colors.grey[50],
              buttonBackgroundColor: Colors.blue[300],
              height: 55.0,
            // animationCurve: Curves.elasticOut,
            
            items: _iconList,
            onTap: (index) {
              setState(() {
                _tabController.animateTo(index);
          });
        },
      ),
    );
  }
}