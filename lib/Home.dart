import 'package:arlab/AddEquation.dart';
import 'package:arlab/AddItem.dart';
import 'package:arlab/Dashboard.dart';
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

  List<AssetImage> img = [
    AssetImage('images/addelm.png'),
    AssetImage('images/addeq.png'),
    AssetImage('images/editelm.png'),
    AssetImage('images/editeq.png'),
    AssetImage('images/start.png'),
    AssetImage('images/logout.png'),

  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.9),
        title: Text('Home'),
        centerTitle: true,
      ),
      drawer: Maindrawer(),
      body: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/Homebg.png'),
                fit: BoxFit.cover)),
        child: Container(
          width: w,
          height: h/2,
          child: Padding(
            padding: const EdgeInsets.only(top:300),
            child:ListView(
              children: <Widget>[
             SizedBox(height: 10,),
                Padding(
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  child: Container(
                        width: w/2.3,
                    height: h/6,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:img[0],
                            fit: BoxFit.cover)
                    ),
                  ),
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AddItem())),
                ),
                InkWell(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AddEquation())),
                  child: Container(
                        width: w/2.3,
                    height: h/6,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:img[1],
                            fit: BoxFit.cover)
                    ),
                  ),
                ),
              ],
            ),
          ),
             Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard())),

                  child: Container(
                        width: w/2.3,
                    height: h/6,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:img[2],
                            fit: BoxFit.cover)
                    ),
                  ),
                ),
                Container(
                      width: w/2.3,
                  height: h/6,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:img[3],
                          fit: BoxFit.cover)
                  ),
                ),
              ],
            ),
          ),
             Padding(
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                      width: w/2.3,
                  height: h/6,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:img[4],
                          fit: BoxFit.cover)
                  ),
                ),
                InkWell(
                  onTap: signout,
                  child: Container(
                        width: w/2.3,
                    height: h/6,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:img[5],
                            fit: BoxFit.cover)
                    ),
                  ),
                ),
              ],
            ),
          ),
              ],


            ),
          ),
        )
      ),
    );
  }
}
