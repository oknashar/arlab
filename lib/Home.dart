import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color c ;
  int i = 0;
  createAlertColor(BuildContext context ,Color color ,int ii){

    var alert =
    Column(
      children: <Widget>[

        AlertDialog(

          title: Text("Color Picker"),
          content: Container(
            width: 150,
            height: 600,
            child: ColorPicker(
                color:_color[ii],
                onChanged:(v) {
                  setState(() {
                    _color[ii] = v;
                    print(_color[ii]);
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
  List<Color> _color = [
    Colors.red,
    Colors.blue,
    Colors.black,
  ];

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
  TextEditingController _controller2 ;
  TextEditingController _controller3 ;
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
                  child: Center(child: Text('Create a new equation',style:TextStyle(fontSize: 20),))

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
                  Container(
                    width: 375,
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color:_color[0],width: 1)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        tff(_controller1,'Enter first element'),
                        IconButton(
                          icon: Icon(Icons.check_box,color:_color[0],),
                          onPressed: (){

                            setState(() {
                              createAlertColor(context, _color[0],0);
                              print(_color[0]);
                            });
                          },

                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 375,
                    margin: EdgeInsets.only(top: 50),
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color:_color[1],width: 1)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[
                        tff(_controller2,'enter Second Element'),
                        IconButton(
                          icon: Icon(Icons.check_box,color:_color[1],),
                          onPressed: (){
                            setState(() {

                              createAlertColor(context, _color[1],1);
                              print(_color[i]);
                            });
                          },

                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 375,
                    margin: EdgeInsets.only(top: 50),
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color:_color[2],width: 1)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        tff(_controller3,'Enter THe Output'),
                        IconButton(
                          icon: Icon(Icons.check_box,color:_color[2],),
                          onPressed: (){
                            setState(() {

                              createAlertColor(context, _color[2],2);
                              print(_color[i]);
                            });
                          },

                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 100,
                    height: 50,
                    margin: EdgeInsets.only(top: 50),
                    decoration: BoxDecoration(
                      color: Colors.red,
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
