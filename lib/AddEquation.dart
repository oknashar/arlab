import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddEquation extends StatefulWidget {
  @override
  _AddEquationState createState() => _AddEquationState();
}

class _AddEquationState extends State<AddEquation> {
  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(),
        body: Container(
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
                              width: w / 5,
                              height: h / 10,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Center(
                                child: Text(
                                  'Na',
                                    style:TextStyle(
                                        fontSize: 20
                                    )
                                ),
                              ),
                            ),
                          )),
                      Container(

                          child: Padding(
                            padding: const EdgeInsets.only(left:30.0,right: 30),
                            child: Container(
                              width: w / 5,
                              height: h / 10,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            child: Center(
                              child: Text(
                                'CL',
                                style:TextStyle(
                                  fontSize: 20
                                ) ,
                              ),
                            ),
                            ),

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
                          Text(
                            'Click to Color lens to Choose Color',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )),
              ),

            ]),
          ),
        ));
  }
}
