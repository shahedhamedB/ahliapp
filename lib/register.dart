import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';


class RegisterScreen extends StatefulWidget{
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  void initState()
  {
    super.initState();

  }

  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();

  @override
  void dispose()
  {
    _namecontroller.dispose();
    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,

        body: Form(
        key: _formkey,
        child:Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
        CircleAvatar(
        radius: 50.0,
        backgroundImage: AssetImage('images/logo.jpg'),
    ),
    Align(

    alignment: Alignment.centerLeft,
    child: Container(
    margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
    child: Text(
    'Register',
    style: TextStyle(
    fontFamily: 'Source Sans Pro',
    fontSize: 30.0,
    color: Colors.black,


    ),
    ),
    ),



    ),
    Card(

    margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
    child: ListTile(
    leading: Icon(
    Icons.person_outline,
    ),
    title: TextFormField(
    controller: _namecontroller,

    decoration: InputDecoration(
    hintText: 'Username',

    ),
    validator: (text) {
    if (text == null || text.isEmpty) {
    return 'Text is empty';
    }
    return null;
    },
    ),
    ),

    ),
          Card(

            margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
            child: ListTile(
              leading: Icon(
                Icons.alternate_email,
              ),
              title: TextFormField(
                controller: _emailcontroller,

                decoration: InputDecoration(
                  hintText: 'Email',

                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Text is empty';
                  }
                  return null;
                },
              ),
            ),

          ),
    Card(
    margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
    child:ListTile(
    leading: Icon(
    Icons.enhanced_encryption,


    ),

    title: TextFormField(
    controller: _passwordcontroller,
    decoration: InputDecoration(
    hintText: 'Password',
    ),
    textAlign: TextAlign.center,
    validator: (text) {
    if (text == null || text.isEmpty) {
    return 'Text is empty';
    }
    return null;
    },

    ),
    trailing: Wrap(
    spacing: 12, // space between two icons
    children: <Widget>[
    // icon-1
    Icon(Icons.visibility_off), // icon-2
    ],
    ),

    ),

    ),

    SizedBox(

    width: 270.0,

    child: MaterialButton(

    child: Text('Register'),
    textColor: Colors.white,
    color: Colors.blue.shade800,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10)
    ),

    onPressed: () async {
      var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);
    setState(() {
    if(_formkey.currentState.validate()){
      if(result != null)
      {
        Firestore.instance.collection('users').document(result.user.uid).setData({
          'name':_namecontroller.text,
          'course':'AI',
          'grade':'32',
          'uid':result.user.uid
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen() ) );

      }else{
        print('please try later');
      }


    }
    });

    },
    ),
    ),
    Column(
    children: <Widget>[
    Row(
    mainAxisAlignment: MainAxisAlignment.center,

    children: <Widget>[

    SizedBox(
    width: 50.0,
    height: 20.0,

    child:  Container(
    child: Divider(
    height: 50.0,
    )),

    ),
    Text(
    "OR",
    style: TextStyle(
    fontFamily: 'Source Sans Pro',
    fontSize: 17.0,
    color: Colors.grey,


    ),

    ),
    SizedBox(
    width: 50.0,
    height: 20.0,

    child:  Container(


    child: Divider(
    height: 50.0,
    )),

    ),
    ]),

    ]),
    Column(

    children: <Widget>[
    Row(
    mainAxisAlignment: MainAxisAlignment.center,

    children: <Widget>[

    Text(
    'Already have account ?',
    style: TextStyle(
    fontFamily: 'Source Sans Pro',
    fontSize: 17.0,
    color: Colors.grey,


    ),
    ),
    InkWell(
    child: Text(" Login",

    style: TextStyle(
    fontFamily: 'Source Sans Pro',
    fontSize: 17.0,
    decoration: TextDecoration.underline,
    color: Colors.blue.shade800,



    ),),
    onTap: () async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen() ) );
    },
    )

    ]),

    ]),


    ],



    ),
    ),
    );

  }
  
}