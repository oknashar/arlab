import 'package:arlab/UpdateItem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'CRUD.dart';
import 'Maindrawer.dart';



class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  CrudFire crud=new CrudFire();
  QuerySnapshot Items;
  FirebaseUser user;
  Future<void> getUserData() async {
    FirebaseUser userdata = await FirebaseAuth.instance.currentUser();
    setState(() {
      user = userdata;
      crud.getData().then((data){
        setState(() {
          Items = data;
        });
      });
    });
  }

  Widget showItems(){


    if(Items !=null  && Items.documents != null){
      return

        ListView.builder(
          itemCount: Items.documents.length,
          itemBuilder: (context,index){
            return Container(

              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: Text('${Items.documents[index].data['name']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  subtitle:Text('${Items.documents[index].data['symbol']}',style:TextStyle(fontSize: 12,fontWeight: FontWeight.bold)) ,
                  trailing:
                      IconButton(
                        icon: Icon(Icons.delete,color: Colors.red,),
                        onPressed: (){
                          crud.delete(Items.documents[index].reference.documentID);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard()));

                        },
                      ),


                  leading:  IconButton(
                    icon: Icon(Icons.edit,color: Colors.green,),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateItem(Items.documents[index])));
                    },
                  ),
                ),

              ],
              ),
            );
          });
    }else if(Items.documents.isEmpty){
      return Center(
        child: Text(
          'You haven\'t data yet please add data',
              style: TextStyle(
            color: Colors.black,
                fontSize: 20
        ),
        ),
      );
    }else{
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.black,
        ),
      );
    }
  }
  @override
  void initState() {
    getUserData();

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(175, 29, 93, 1),
        title: Text('Add Element'),
        centerTitle: true,
      ),
      drawer: Maindrawer(),
      body: Container(
        child: showItems(),
      )
    );
  }
}
