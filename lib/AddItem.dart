import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';


class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
Color _color =Colors.red;
  createAlertColor(BuildContext context ,Color color){

    var alert =
    Column(
      children: <Widget>[

        AlertDialog(

          title: Text("Color Picker"),
          content: Container(
            width: 150,
            height: 600,
            child: ColorPicker(
                color:_color,
                onChanged:(v) {
                  setState(() {
                    _color = v;
                    print(_color);
                  });
                }
            ),
          ),
        )
      ],
    );
    showDialog(context: context , builder: (context){
      return alert;


    });
  }

Widget tff(TextEditingController controller,String hint){
  return  Container(
    width: 300,
    height: 50,

    child: TextFormField(
      controller: controller,
      style: TextStyle(
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
          hintText:hint,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          //  focusedBorder: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.grey.shade700,

          )
      ),
    ),
  );
}
TextEditingController _controller1 ;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              right: MediaQuery.of(context).size.width/2-100,

              child: Container(
                  width: 200,
                  height: 50,

                  decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(70),
//                      border: Border.all(color: Colors.lightGreen,width: 2)
                  ),
                  child: Center(child: Text('Adding a new Item',style:TextStyle(fontSize: 20),))

              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 500,

              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(70),
                //  border: Border.all(color: Colors.lightGreen,width: 2)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: 375,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color:_color,width: 1)
                        ),

                           child:Padding(
                             padding: const EdgeInsets.all(10),
                             child: tff(_controller1,'Enter first element'),
                           ),

                      ),

                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Color:',style: TextStyle(fontSize: 24),),
                            IconButton(
                              icon: Icon(Icons.bookmark,color:_color,size: 60,),
                              onPressed: (){

                                setState(() {
                                  createAlertColor(context, _color);
                                });
                              },

                            ),
                          ],
                        ),
                      ),
                    ],
                  ),


                  Container(
                    width: 100,
                    height: 50,
                    margin: EdgeInsets.only(top: 50),
                    decoration: BoxDecoration(
                      color: _color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
