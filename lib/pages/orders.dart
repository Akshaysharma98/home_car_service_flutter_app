import 'package:flutter/material.dart';
import 'package:hcr/bottom_navigation/bottom_navigation.dart';
import 'package:hcr/pages/homepage.dart';
import 'package:hcr/pages/myorders.dart';
import 'package:hcr/sidebar/sidebar.dart';

class MyOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            body: Stack(
                children: <Widget>[
                  MyOrdersPage(),
                  // BottomNavigation(),
                  SideBar(),
                ],
        ),
      ),
    );
  }
}