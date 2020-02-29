import 'package:arlab/Dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'AddItem.dart';
import 'DeleteItem.dart';
import 'SignIn.dart';

class Maindrawer extends StatefulWidget {
  @override
  _MaindrawerState createState() => _MaindrawerState();
}

class _MaindrawerState extends State<Maindrawer> {
  FirebaseUser user;
  Future<void> getUserData() async {
    FirebaseUser userdata = await FirebaseAuth.instance.currentUser();
    setState(() {
      user = userdata;
      print(userdata.email);
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
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          width: double.infinity,
          height: h,
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: h / 4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/background.png'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      user.email,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 20.0, bottom: 10, right: 20),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dashboard())),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.dashboard,
                              color: Color.fromRGBO(67, 30, 75, 1),
                            ),
                          ),
                          Text(
                            'Dashboard',
                            style: TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddItem())),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.add_circle,
                              color: Color.fromRGBO(67, 30, 75, 1),
                            ),
                          ),
                          Text(
                            'Add',
                            style: TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: signout,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.update,
                              color: Color.fromRGBO(67, 30, 75, 1),
                            ),
                          ),
                          Text(
                            'Update',
                            style: TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>DeleteItem())),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Color.fromRGBO(67, 30, 75, 1),
                            ),
                          ),
                          Text(
                            'Delete',
                            style: TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Color.fromRGBO(67, 30, 75, 1),
                    ),
                    InkWell(
                      onTap: signout,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.settings,
                              color: Color.fromRGBO(67, 30, 75, 1),
                            ),
                          ),
                          Text(
                            'Setting',
                            style: TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: signout,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.help,
                              color: Color.fromRGBO(67, 30, 75, 1),
                            ),
                          ),
                          Text(
                            'Help',
                            style: TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: signout,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.exit_to_app,
                              color: Color.fromRGBO(67, 30, 75, 1),
                            ),
                          ),
                          Text(
                            'Logout',
                            style: TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

