import 'package:arlab/AddItem.dart';
import 'package:arlab/Maindrawer.dart';
import 'package:arlab/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseUser user;
  Future<void> getUserData() async {
    FirebaseUser userdata = await FirebaseAuth.instance.currentUser();
    setState(() {
      user = userdata;
      print(userdata.uid);
    });
  }

  Future<void> signout() async {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignIn()));
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.9),
        title: Text('ADD'),
        centerTitle: true,
      ),
      drawer: Maindrawer(),
      body: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'),
                fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Container(
              width: w / 1.5,
              height: h / 4,

            ),
            InkWell(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddItem())),
              child: Container(
                width: w / 1.5,
                height: h / 12,
                color: Colors.white,
                child: Center(
                  child: Text(
                    'ADD ELEMENT',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h / 12,
            ),
            Container(
              width: w / 1.5,
              height: h / 12,
            color: Colors.white,
              child: Center(
                child: Text(
                  'ADD EQUATION',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
