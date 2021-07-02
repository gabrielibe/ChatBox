import 'package:chat_app/screens/constants.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id ='login screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool spinner = false;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 200.0,
                child:  Hero(
                  tag: 'ico',
                  transitionOnUserGestures: true,
                  child: Container(
                    child: Icon(Icons.add,color: Colors.blue,size: 200,),

                  ),
                ),
              ),
              SizedBox(
                height: 35.0,
              ),
              TextField(

                onChanged: (value) {
                  email = value;
                  //Do something with the user input.
                },
                decoration: fieldText,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) {
                  password= value;
                  //Do something with the user input.
                },
                decoration: fieldText.copyWith(
                  hintText: 'Enter your password here'
                )
              ),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      setState(() {
                        spinner =true;
                      });
                      try{
                      final user = await _auth.signInWithEmailAndPassword(email: email, password: password);

    if( user != null){
      setState(() {
        spinner = false ;
      });
    Navigator.pushNamed(context, ChatScreen.id);}
                      //Implement login functionality.
                    }
                    catch(e){
                        print (e);
                    }
                    },

                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Log In',
                    ),
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
