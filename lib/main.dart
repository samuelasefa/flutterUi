import 'package:flutter/material.dart';
import 'package:myapp/splash_screen_one.dart';
// import 'LoginPage.dart';
// import 'package:myapp/NavsideBar.dart';

void main() => runApp(MaterialApp(
  title: 'Online Bidding System',
  theme: ThemeData(
    primaryColor: Colors.green,
    accentColor: Colors.orange
  ),
debugShowCheckedModeBanner:true,
home: SplashScreenOne(),
// home:NavsideBar(),
// home: LoginPage(),
));
