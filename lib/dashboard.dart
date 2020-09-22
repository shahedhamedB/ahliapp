import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class DashboardScreen extends StatelessWidget {

  final FirebaseAuth auth = FirebaseAuth.instance;

   inputData() {
    final User user = auth.currentUser;
    final uid = user.email;
    // here you write the codes to input the data into firestore
    print(uid);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: SafeArea(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/logo.jpg'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 30.0,
                    color: Colors.grey.shade700,


                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
                child: Text(
                  'Name: ',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,



                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
                child: Text(
                  'Course: '+'AI',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,



                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
                child: Text(
                  'grade: '+'32',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,

                    color: Colors.black,



                  ),
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
              SizedBox(
                width: double.infinity,



                child:  Container(
                    child: Divider(
                      height: 50.0,
                      color: Colors.black,



                    )),

              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
                child: Text(
                  'All Rights Reserved',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                    color: Colors.blue.shade700,


                  ),
                ),
              ),



            ],



          ),
        ),
      ),
    );
  }

}