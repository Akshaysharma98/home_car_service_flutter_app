import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      
      body: Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(
            colors: [Color(0xFFFFFFEE),  Color(0x1FD1F9)]),
          
    //         image: const DecorationImage(
    //   image: AssetImage('Images/login_background.jpg'),
    //   fit: BoxFit.cover,
    // ),
            ),
        child: Stack(
          children: <Widget>[
            // Image.asset('Images/login_background.jpg',fit: BoxFit.fill,),
            Center(
              child: Form(
                child: ListView(
                  children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage('Images/white_trans_small.png'),
                            backgroundColor: Colors.transparent,
                            radius: 60,
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}