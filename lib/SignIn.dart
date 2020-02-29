import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Home.dart';
import 'SignUp.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String _email, _password;

  Future <void> login() async {
    final formdata = formstate.currentState;
    if (formdata.validate()) {
      formdata.save();
      try {
        AuthResult fireuser = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Home()));

        print(fireuser.user.email);
      } catch (error) {
        print(error.message);
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            width: w,
            height: h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/signInbg.png"),
                    fit: BoxFit.cover)),
            child: Form(
              key: formstate,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: h/2,
                  ),

                  //Logo added


                  // Email TextField
                  Container(
                    width: w - 50,
                    decoration: BoxDecoration(),
                    child: TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.person, color: Colors.black),
                        labelText: 'UserName',
                        border:
                        OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        labelStyle: TextStyle(fontSize: 20),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        // ignore: missing_return, missing_return
                        if (val.isEmpty) {
                          return 'please Enter your Email';
                        }
                      },
                      onSaved: (val) {
                        _email = val;
                      },
                    ),
                  ),


                  SizedBox(
                    height: 20,
                  ),

                  //Password TextField
                  Container(
                    width: w - 50,
                    decoration: BoxDecoration(),
                    child: TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.lock, color: Colors.black),
                        labelText: 'Password',
                        border:
                        OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        labelStyle: TextStyle(fontSize: 20),
                      ),
                      obscureText: true,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'please enter your password';
                        } else if (val.length < 3) {
                          return 'the password must be more than 3 char';
                        }
                      },
                      onSaved: (val) {
                        _password = val;
                      },
                    ),
                  ),
                  Container(
                    width: w - 50,
                    height: 1,
                    color: Color.fromRGBO(112, 112, 112, 1),
                  ),
                  // Forget Password
                  SizedBox(
                    height: h / 100,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: w - 160,
                      ),
                      Text(
                        'Forget Password?',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      )
                    ],
                  ),

                  //Login Button
                  SizedBox(
                    height: h / 20,
                  ),
                  InkWell(
                    onTap: () => login(),
                    child: Container(
                      width: w / 1.5,
                      height: h / 20,
                      color: Color.fromRGBO(40, 49, 54, 1),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: h / 30,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                      InkWell(
                        child: Text(
                          'SignUp',
                          style: TextStyle(color: Colors.black, fontSize: 22),
                        ),
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp())),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
