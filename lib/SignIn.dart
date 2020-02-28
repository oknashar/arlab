import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SignUp.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


  @override
  Widget build(BuildContext context) {
    double w =MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(

     body: Container(
       width:w,
       height: h,
       decoration: BoxDecoration(
         image: DecorationImage(
           image: AssetImage("images/Loginbg.png"),
           fit: BoxFit.cover
         )
       ),
       child: Column(
         children: <Widget>[
           SizedBox(height: 200,),

           //Logo added
           Container(
       width:w/1.5,
       height:  h/5,
       decoration: BoxDecoration(
           image: DecorationImage(
               image: AssetImage("images/vlabpos.png"),
               fit: BoxFit.cover
           )
       ),),


           // Username TextField
           Container(
             width:w-50,
              decoration: BoxDecoration(
              ),
             child: TextFormField(
               decoration: InputDecoration(
                 hintText: 'Username',
                 hintStyle: TextStyle(
                   color: Color.fromRGBO(60, 31, 74, 1),
                   fontSize: 16
                 ),
                 icon: Icon(Icons.person,color:Color.fromRGBO(60, 31, 74, 1),size:w/12,),
                 border: InputBorder.none
               ),
             ),
           ),
           Container(
             width:w-50,
             height: 1,
             color: Color.fromRGBO(112, 112, 112, 1),
           ),

           SizedBox(height: 20,),

           //Password TextField
           Container(
             width:w-50,
             decoration: BoxDecoration(
             ),
             child: TextFormField(
               decoration: InputDecoration(
                   hintText: 'Password',
                   hintStyle: TextStyle(
                       color: Color.fromRGBO(60, 31, 74, 1),
                       fontSize: 16
                   ),
                   icon: Icon(Icons.lock,color:Color.fromRGBO(60, 31, 74, 1),size:w/12,),
                   border: InputBorder.none
               ),
             ),
           ),
           Container(
             width:w-50,
             height: 1,
             color: Color.fromRGBO(112, 112, 112, 1),
           ),
          // Forget Password
           SizedBox(height: h/40,),
           Row(
             children: <Widget>[
               SizedBox(width:w-160,),
               Text('Forget Password?',style: TextStyle(
                 fontSize: 16,
                 color: Colors.grey
               ),)
             ],
           ),


           //Login Button
           SizedBox(height: h/20,),
           Container(
            width: w/1.5,
             height: h/5,
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage('images/loginbtn.png')
               )
             ),
             child: Center(
               child: Text(
                 'Login',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 20
                 ),
               ),
             ),
           ),

           SizedBox(height: h/10,),

           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[

               Text(
                 'Don\'t have an account?',
                 style: TextStyle(
                     color: Colors.grey,
                     fontSize: 20
                 ),
               ),
                  InkWell(
                 child: Text(
                   'SignUp',

                   style: TextStyle(
                       color: Colors.black,

                       fontSize: 22
                   ),
                 ),
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp())),
               ),
             ],
           )

         ],
       ),
     ),
    );
  }
}
