import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical:8 ,horizontal:15),
      child: ListView(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.lightBlueAccent,
                radius: 20,
              ),
              SizedBox(
                width:10,
              ),
              Column(
                children: [
                  Text('MyStatus'),
                  SizedBox(
                    width: 5,
                  ),
                  Opacity(
                    opacity: 0.5,
                    child: Text('No updates',
                      style: TextStyle(
                      fontSize: 12
                    ),),
                  )
                ],
              )

            ],
          ),

          Text('Recent'),
          Divider(
            endIndent: 0.1,
          )
        ],

      )
    );
  }
}



