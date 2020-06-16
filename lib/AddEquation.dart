import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CRUD.dart';
import 'Dashboard.dart';

class AddEquation extends StatefulWidget {
  @override
  _AddEquationState createState() => _AddEquationState();
}

class _AddEquationState extends State<AddEquation> {
    CrudFire crud = new CrudFire();
  QuerySnapshot Items;
  FirebaseUser user;
  Future<void> getUserData() async {
    FirebaseUser userdata = await FirebaseAuth.instance.currentUser();
    setState(() {
      user = userdata;
      crud.getData().then((data) {
        setState(() {
          Items = data;
        });
      });
    });
  }



  @override
  void initState() {
    getUserData();
    crud.getData().then((data){
      Items = data;
    });
    super.initState();
  }
  String input1,input2,output;
    void addEquation(){
      print(input2);
     Firestore.instance.collection('Equation').add({
       'Input1': input1,
       'Input2':input2,
       'output':output,
       'userid':user.uid
     });
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard()));
    }

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(),
        body: Items==null?Center(child: CircularProgressIndicator()): Container(
          width: w,
          height: h,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/background.png'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 20),
            child: ListView(children: <Widget>[
              Container(
                width: w / 1.4,
                height: h / 4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/input.png'),
                        fit: BoxFit.fill)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(

                          child: Padding(
                            padding: const EdgeInsets.only(left:30.0),
                            child: Container(
                              width: w / 3,
                              height: h /8,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child:  ListView.builder(
                                itemCount: Items.documents.length,
                                semanticChildCount: 1,
                                physics: PageScrollPhysics(),
                                itemBuilder:(context,i){
                                  
                                  
                                  input1 = Items.documents[i].documentID;
                                  return  Container(
                                width: w / 3,
                                height: h / 8,
                                decoration: BoxDecoration(
                                   borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  color: Color(Items.documents[i].data['color']),
                                    ),
                                    child: Center(
                                           child: Text(
                                             '${Items.documents[i].data['name']}',
                                               style:TextStyle(
                                                   fontSize: 20,
                                                   color: Colors.white
                                            ) ,
                                          ),
                                        ),

                                 
                              );
                               
                              
                                }
                                
                                ),
                            ),
                          )),
                      Container(

                          child: Padding(
                            padding: const EdgeInsets.only(left:30.0,right: 30),
                            child: Container(
                              width: w / 3,
                                height: h / 8,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius:
                                        BorderRadius.all(Radius.circular(20))
                                ),
                                
                              child: ListView.builder(
                                itemCount: Items.documents.length,
                                semanticChildCount: 1,
                                physics: PageScrollPhysics(),
                                itemBuilder:(context,i){
                                  
                                input2 = Items.documents[i].documentID;
                                  
                                  return  Container(
                                width: w / 3,
                                height: h / 8,
                                decoration: BoxDecoration(
                                   borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  color: Color(Items.documents[i].data['color']),
                                    ),
                                    child: Center(
                                           child: Text(
                                             '${Items.documents[i].data['name']}',
                                               style:TextStyle(
                                                   fontSize: 20,
                                                   color: Colors.white
                                            ) ,
                                          ),
                                        ),

                                 
                              );
                            
                                }
                                
                                ),
                            )

                          )),


                    ],

                ),
              ),
              ),
              Container(
                width: w / 1.2,
                height: h / 2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/output.png'),
                        fit: BoxFit.cover)),
                   child: Center(
                    child: InkWell(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                         Container(
                              width: w / 3,
                                height: h / 8,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius:
                                        BorderRadius.all(Radius.circular(20))
                                ),
                                
                              child: ListView.builder(
                                itemCount: Items.documents.length,
                                semanticChildCount: 1,
                                physics: PageScrollPhysics(),
                                itemBuilder:(context,i){
                                  
                                   output = Items.documents[i].documentID;
                                   
                                  return  Container(
                                width: w / 3,
                                height: h / 8,
                                decoration: BoxDecoration(
                                  color: Color(Items.documents[i].data['color']),
                                   borderRadius:
                                        BorderRadius.all(Radius.circular(20))
                                    ),
                                    child: Center(
                                           child: Text(
                                             '${Items.documents[i].data['name']}',
                                               style:TextStyle(
                                                   fontSize: 20,
                                                   color: Colors.white
                                            ) ,
                                          ),
                                        ),

                                 
                              );
                              
                                }
                                
                                ),
                            )
                        ],
                      ),
                    )),
              ),
              SizedBox(height: h/30,),
              InkWell(
                  onTap: addEquation,
                  child: Container(
                    width: w/2,
                    height: h/14,
                   color: Colors.white,
                    child: Center(
                      child: Text('Add',style: TextStyle(
                        color: Colors.black,
                        fontSize: 26
                      ),),
                    ),
                  ),
                )

            ]),
          ),
        ));
  }
}
