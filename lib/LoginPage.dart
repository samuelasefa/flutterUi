
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Home.dart';
// import 'package:myapp/splash_screen_one.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  bool ValidateAndSave() {
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }else{
      return false;
    }
  }

  void validateAndSubmit(){
    if(ValidateAndSave()){

    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('Online Bidding'),
      ),
       body:new Container(
       padding: EdgeInsets.symmetric(horizontal: 24.0),
       child: new Form(
         key: formKey,
         child: new Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: <Widget>[
             SizedBox(height: 25.0),
             new Text(
                'Login',
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
             ),
             SizedBox(height: 15.0),
             new TextFormField(
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 labelText: 'Email',
                 filled: true,
               ),
               validator: (value) => value.isEmpty ? 'Email can\'t be empty': null,
               onSaved: (value) => _email= value,
             ),
             SizedBox(height: 15.0),
             new TextFormField(
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 labelText: 'Password',
                 filled: true,    
               ),
               validator: (value) => value.isEmpty ? 'Password can\'t be empty': null,
               onSaved: (value) => _password= value,
               obscureText: true,
             ),
             SizedBox(height: 15.0),
             
             Container(
               height: 50.0,
               child: new RaisedButton(
                 child: new Text('Login',style: new TextStyle(fontSize: 20.0)),
                 color: Colors.blueAccent,
                 textColor: Colors.white,
                 onPressed: () {
                   Navigator.push(context, new MaterialPageRoute(builder: (context) => new  Home()));
                 }
                //  validateAndSubmit,
               ),
             ),
           ],
         ),
       ),
       )
    );
  }
}