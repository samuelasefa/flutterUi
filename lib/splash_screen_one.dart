import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/LoginPage.dart';
import 'package:myapp/SignUpPage.dart';
import 'package:myapp/SignUpPage1.dart';

// import 'package:path/path.dart';
// import 'dart:async';
// import 'package:myapp/main.dart';

class SplashScreenOne extends StatefulWidget {
  @override
  _SplashScreenOneState createState() => _SplashScreenOneState();
}

const TextStyle textStyle = TextStyle(
  color: Colors.white,
  // fontFamily: 'OpenSans',
);

enum Options { PublicBody, Supplier }
Future<Options> _asyncSimpleDialog(BuildContext context) async {
  return await showDialog<Options>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Create an account us'),
          children: <Widget>[
            SimpleDialogOption(
              child: const Text('PublicBody'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
              },
            ),
            
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage1()));
              },
              child: const Text('Supplier'),
            ),
          ],
        );
      });
}
class _SplashScreenOneState extends State<SplashScreenOne>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 3000),
      vsync: this,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  final background = Container(
    decoration: BoxDecoration(
        image: DecorationImage(
      image: AssetImage('assets/images/background.jpg'),
      fit: BoxFit.cover,
    )),
  );
  final orangeOpacity = Container(
    color: Color(0XAA69F0CF),
  );

  Widget button(String label, Function onTap) {
    return FadeTransition(
      opacity: animation,
      child: new SlideTransition(
        position: Tween<Offset>(begin: Offset(0.0, -0.6), end: Offset.zero)
            .animate(controller),
        child: Material(
          color: Color(0xBB00D699),
          borderRadius: BorderRadius.circular(30.0),
          child: InkWell(
            onTap:onTap,
            splashColor: Colors.white24,
            highlightColor: Colors.white10,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 13.0),
              child: Center(
                child: Text(
                  label,
                  style: textStyle.copyWith(fontSize: 18.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final logo = new ScaleTransition(
      scale: animation,
      child: Image.asset(
        'assets/images/need_for_speed.png',
        width: 180.0,
        height: 180.0,
      ),
    );  
    final description = new FadeTransition(
      opacity: animation,
      child: new SlideTransition(
        position: Tween<Offset>(begin: Offset(0.0, -0.8), end: Offset.zero)
            .animate(controller),
        child: Text(
          'Bid online and make ur life esay',
          textAlign: TextAlign.center,
          style: textStyle.copyWith(fontSize: 24.0),
        ),
      ),
    );
    final separator = new FadeTransition(
      opacity: animation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(width: 20.0, height: 2.0, color: Colors.white),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'OR',
              style: textStyle,
            ),
          ),
          Container(width: 20.0, height: 2.0, color: Colors.white),
        ],
      ),
    );

    final signWith = new FadeTransition(
      opacity: animation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Sign in with',
            style: textStyle,
          ),
          GestureDetector(
            onTap: () {
              print('google');
            },
            child: Text(
              ' Google',
              style: textStyle.copyWith(
                  color: Color(0xBB009388),
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          ),
          Text(
            ' or',
            style: textStyle,
          ),
          GestureDetector(
            onTap: () {
              print('Facebook');
            },
            child: Text(
              ' Facebook',
              style: textStyle.copyWith(
                  color: Color(0xBB009388),
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          background,
          orangeOpacity,
          new SafeArea(
            child: new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  logo,
                  SizedBox(height: 30.0),
                  description,
                  SizedBox(height: 60.0),
                  button('Create an account',() =>
                  _asyncSimpleDialog(context),
                  ),
                  SizedBox(height: 8.0),
                  button('Sign in', () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new LoginPage()));
                  }),
                  SizedBox(height: 30.0),
                  separator,
                  SizedBox(height: 30.0),
                  signWith
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
