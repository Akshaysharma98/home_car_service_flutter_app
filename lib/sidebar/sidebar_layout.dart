import 'package:flutter/material.dart';
import 'package:hcr/pages/homepage.dart';
import 'package:hcr/sidebar/sidebar.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            body: Stack(
                children: <Widget>[
                  HomePage(),
                  SideBar(),
                ],
        ),
      ),
    );
  }
}