import 'package:flutter/material.dart';
import './Textpage.dart';
import 'package:myapp/LoginPage.dart';
class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

enum Conformation {CANCEL, ACCEPT }

Future<Conformation> _asyncSimpleDialog(BuildContext context) async {
  return showDialog<Conformation>(
    context:context,
    barrierDismissible: false,
    builder: (BuildContext context){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AlertDialog(
            title: Text('Logout'),
            content: const Text('are you shure u want to logout ?'),
            actions: <Widget>[
              FlatButton(
                child: new Text('ACCEPT'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                },
              ),
              FlatButton(
                child: new Text('CANCLE'),
                onPressed: (){
                  Navigator.of(context).pop();
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>()));
                },
              )
            ],
          ),
        ],
      );
    }
  );
}

class _HomeState extends State<Home> {
  String mainProfilePictures =
      "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwj2yP-L2qfhAhWR5OAKHQxhAF8QjRx6BAgBEAU&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fman%2F&psig=AOvVaw2gSU3CkqwP7L2odyaC9usC&ust=1553961030085803";
  String otherProfilePictures =
      "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwj2yP-L2qfhAhWR5OAKHQxhAF8QjRx6BAgBEAU&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fman%2F&psig=AOvVaw2gSU3CkqwP7L2odyaC9usC&ust=1553961030085803";

  void switchUser() {
    String backupSting = mainProfilePictures;
    this.setState(() {
      mainProfilePictures = otherProfilePictures;
      otherProfilePictures = backupSting;
    });
  }
  // warrning alert box
  void Warrning(BuildContext context){
    var alertDialog = AlertDialog(
      title: Text('Do you want to exit ?'),
      content: Text('Exit permanently from the page'),
    );
    
    
    showDialog(
      context: context,
      builder: (BuildContext context) => alertDialog
    );
  }
  void showSnackBar(BuildContext context){
    var snackBar = SnackBar(
      content: Text('you just clicked FAB bar '),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Online Bidding"),
          backgroundColor: Colors.orange,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Home',
              ),
              Tab(
                text: 'Legislations',
              ),
              Tab(
                text: 'Award',
              ),
              Tab(
                text: 'Tender',
              ),
            ],
          ),
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text('samuel asefa'),
                accountEmail: new Text('samuelmam44@gmail.com'),
                currentAccountPicture: new GestureDetector(
                  onTap: () => print('This is the current picture'),
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(mainProfilePictures),
                  ),
                ),
                otherAccountsPictures: <Widget>[
                  new GestureDetector(
                    onTap: () => switchUser(),
                    child: new CircleAvatar(
                      backgroundImage: new NetworkImage(otherProfilePictures),
                    ),
                  ),
                ],
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new AssetImage('assets/images/background.jpg'),
                    // NetworkImage('https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwjEnaua2KfhAhUGxYUKHaalAS8QjRx6BAgBEAU&url=https%3A%2F%2Fwww.123rf.com%2Fphoto_88167185_stock-vector-auction-isometric-conceptual-composition-with-desktop-computer-and-smartphones-taking-action-in-onli.html&psig=AOvVaw31U0U7NkvDaHC9j3C3VeWk&ust=1553960502153722')
                  ),
                ),
              ),
              new ListTile(
                title: new Text('Profile'),
                trailing: new Icon(Icons.people),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new Textpage('Profile')));
                },
              ),
              new ListTile(
                title: new Text('Search'),
                trailing: new Icon(Icons.search),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new Textpage('Search')));
                },
              ),
              new ListTile(
                title: new Text('Setting'),
                trailing: new Icon(Icons.settings),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new Textpage('Setting')));
                },
              ),
              new ListTile(
                title: new Text('About'),
                trailing: new Icon(Icons.info),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new Textpage('About')));
                },
              ),
              new ListTile(
                title: new Text('Logout'),
                trailing: new Icon(Icons.exit_to_app),
                onTap:() => _asyncSimpleDialog(context),
              ),
              new Divider(),
              new ListTile(
                title: new Text('Exit'),
                trailing: new Icon(Icons.cancel),
                onTap: () => Warrning(context),
              )
            ],
          ),
        ),
        body: new Center(
          child: new Text(
            'HomePage',
            style: new TextStyle(fontSize: 35.0),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            debugPrint('FAB clicked');
          },
          child: Icon(Icons.add),
          tooltip: 'Add one or More Item',
        ),
      ),
    );
  }
}
