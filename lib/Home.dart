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
        backgroundColor: Color.fromRGBO(175, 29, 93, 1),
        title: Text('ADD'),
        centerTitle: true,
      ),
      drawer: Maindrawer(),
      body: Container(
        width: w,
        height: h,
        child: Column(
          children: <Widget>[
            Container(
              width: w / 1.5,
              height: h / 4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/vlabpos.png'),
                      fit: BoxFit.cover)),
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddItem())),
              child: Container(
                width: w / 1.5,
                height: h / 12,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/appbarbg.png'),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Text(
                    'ADD ELEMENT',
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/appbarbg.png'),
                      fit: BoxFit.cover)),
              child: Center(
                child: Text(
                  'ADD EQUATION',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
