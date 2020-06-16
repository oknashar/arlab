import 'package:arlab/CRUD.dart';
import 'package:arlab/Dashboard.dart';
import 'package:arlab/Maindrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';

import 'SignIn.dart';

class UpdateItem extends StatefulWidget {
  DocumentSnapshot document;
  UpdateItem(this.document);
  @override
  _UpdateItemState createState() => _UpdateItemState();
}

class _UpdateItemState extends State<UpdateItem> {
  CrudFire crud=new CrudFire();
  FirebaseUser user;
  Future<void> getUserData() async {
    FirebaseUser userdata = await FirebaseAuth.instance.currentUser();
    setState(() {
      user = userdata;
      print(user.uid);
    });
  }
  Future<void> signout() async {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignIn()));
  }
  updateElement(){
    if(formstate.currentState.validate()){
      formstate.currentState.save();
      print(_selectedColor.toString());
      crud.update({
        'name':_name,
        'symbol':_Symbol,
        'color':_selectedColor.value,
        'userid':user.uid
      }, widget.document.documentID);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
    }
  }

  createAlertColor(BuildContext context ,Color color ){
    var alert =
    ListView(
        children: <Widget>[

          AlertDialog(

              title: Text("Color Picker"),
              content: Container(
                width: 150,
                height: MediaQuery.of(context).size.height/1.3,
                child: Column(
                  children: <Widget>[
                    ColorPicker(
                        color:Colors.red,
                        onChanged:(v) {
                          setState(() {
                            _selectedColor = v;
                            print(_selectedColor);
                          });
                        }
                    ),
                    RaisedButton(
                      color: Colors.red,
                      child: Center(
                        child:Text('Save',style: TextStyle(color: Colors.white),),
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              )
          )
        ]
    );
    showDialog(context: context , builder: (context){
      return alert;



    });
  }
  @override
  void initState() {
    super.initState();
    _selectedColor=Color(widget.document.data['color']);
    getUserData();
  }
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String _name,_Symbol,_color;
  Color _selectedColor;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.9),
        title: Text('Update Element'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),

      body: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'),
                fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0,top: 20),
          child: Form(
            key: formstate,
            child: ListView(

              children: <Widget>[
                Container(
                  width: w / 1.2,
                  height: h / 4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/form1.png'),
                          fit: BoxFit.fill)),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: h / 20,
                        ),
                        Container(
                          width: w / 1.5,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(114, 29, 83, 1),
                                  fontSize: 16,
                                ),
                                border: InputBorder.none),
                            validator: (val){
                              if(val==null){
                                return 'Please Enter a name';
                              }
                            },
                            onSaved: (val){
                              _name=val;
                            },
                            initialValue: widget.document.data['name'],
                          ),
                        ),
                        Container(
                          width: w / 1.4,
                          height: 1,
                          color: Color.fromRGBO(92, 29, 79, 1),
                        ),
                        SizedBox(
                          height: h / 40,
                        ),
                        Container(
                          width: w / 1.5,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Symbol',
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(114, 29, 83, 1),
                                  fontSize: 16,
                                ),
                                border: InputBorder.none),
                            validator: (val){
                              if(val==null){
                                return 'Please Enter a Symbol';
                              }
                            },
                            onSaved: (val){
                              _Symbol=val;
                            },
                            initialValue: widget.document.data['symbol'],
                          ),
                        ),
                        Container(
                          width: w / 1.4,
                          height: 1,
                          color: Color.fromRGBO(92, 29, 79, 1),
                        )
                      ],
                    ),
                  ),
                ),

                Container(
                  width: w / 1.2,
                  height: h / 5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/form2.png'),
                          fit: BoxFit.fill)),
                  child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Click to Color lens to Choose Color',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          InkWell(
                            onTap:(){ createAlertColor(context, _selectedColor);
                            _color=_selectedColor.toString();},
                            child: IconButton(
                              icon: Icon(Icons.color_lens,size: 80,color: _selectedColor,), onPressed: () {  },

                            ),
                          ),
                        ],
                      )
                  ),
                ),
                SizedBox(height: h/15,),
                InkWell(
                  onTap: updateElement,
                  child: Container(
                    width: w/2,
                    height: h/14,
                    color: Colors.white,
                    child: Center(
                      child: Text('Update',style: TextStyle(
                          color: Colors.black,
                          fontSize: 26
                      ),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
