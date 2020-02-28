
import 'dart:async';
import 'package:arlab/SignIn.dart';
import 'package:flutter/material.dart';




class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}


class _SplashState extends State<Splash> {
   
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      Duration(seconds: 5),
        () => Navigator.pushReplacement(context , MaterialPageRoute(builder: (context)=>SignIn())));

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/backGround.png")
          )
        ),
      ),
    );

  }
}
