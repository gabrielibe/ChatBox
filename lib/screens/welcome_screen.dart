import 'package:chat_app/screens/LoginScreen.dart';
import 'package:chat_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/components/blocks.dart';

class WelcomeScreen extends StatefulWidget {
  static const  String id = 'welcome screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>  with SingleTickerProviderStateMixin{
  //create animation controler
  AnimationController controler;
  //Actual animation
  Animation animation;

  @override
  //init state sto that animation starts when app starts
  void initState(){
    super.initState();
    //create animcontroler object.specifies durations and ticker which is this welcome screen wighet with the use of SIngle with ticker somethign
    controler=AnimationController(duration:Duration(seconds: 4),vsync: this);
    //actaul animation itself.can be tween or curves or anything basically
    animation= ColorTween(begin: Colors.blueGrey,end: Colors.white).animate(controler);
    //move animatio fprward .In the csae of backward specify a starting value
    controler.forward();
    controler.addListener(() {
      setState(() {

      });
      print(controler.value);
      print(animation.value);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag:'ico',
                  child: Container(
                    child: Icon(Icons.add,color: Colors.blue,),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(text:
                ['Flash Chat',],
                  textStyle : TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            button(Colo: Colors.lightBlueAccent,text:'Log In',screenId: LoginScreen.id ),
            button(Colo: Colors.blueAccent,text: 'register',screenId:RegistrationScreen.id ,),

          ],
        ),
      ),
    );
  }
}

