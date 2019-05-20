import 'package:flutter/material.dart';


class Profile extends StatefulWidget {

  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Profile',style: TextStyle(fontSize: 30.0),
      textAlign: TextAlign.center,),
    );
  }
}