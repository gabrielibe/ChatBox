import 'package:flutter/material.dart';



class button extends StatelessWidget {

  Color Colo;
  String text;
  String screenId;

  button({this.Colo,this.text,this.screenId});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: Colo,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context,screenId);
            //Go to login screen.
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(text
          ),
        ),
      ),
    );
  }
}
