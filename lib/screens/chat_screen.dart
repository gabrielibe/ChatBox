import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

var puck;
bool spinner = false;
final _firestore = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
 var TextEditingcontr = TextEditingController();
  dynamic user1;
  String messagetext;

  void initState() {
    super.initState();
    GetUser();
  }

  void GetUser() async {
    try {
       var user = await auth.currentUser;
      if (user != null) {
        user1 = user.email;
      }
    } catch (e) {
      print(e);
    }
  }

  void Mesastream() async {
    await for (var snapshots in _firestore.collection('messages').snapshots()) {
      for (var message in snapshots.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.power),
              onPressed: () {
                // Mesastream();
              }
              // auth.signOut();
              // Navigator.pop(context);
              //Implement logout functionality

              ),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: SafeArea(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MEssageStream(),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: TextEditingcontr,
                        onChanged: (value) {
                          messagetext = value;
                          //Do something with the user input.
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        TextEditingcontr.clear();
                        _firestore.collection('messages').add({
                          'sender': user1,
                          'text': messagetext,
                        });

                        //Implement send functionality.
                      },
                      child: Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class MessageBublle extends StatelessWidget {
  String message;
  String sender;

  MessageBublle({this.message,this.sender});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical :10),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(sender
          ,style: TextStyle(
              color: Colors.black45,
                fontWeight: FontWeight.w100,
            ),),
          Material(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(5),
            elevation: 10,
            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(message),
            ),
          ),
        ],
      ),
    );
  }
}

class MEssageStream extends StatefulWidget {
  @override
  _MEssageStreamState createState() => _MEssageStreamState();
}

class _MEssageStreamState extends State<MEssageStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (Context, snapshot) {
        if (!snapshot.hasData == true){
          spinner = true;
          setState(() {
          });
        }
        else
        {
          final messages = snapshot.data.docs;
          List<Widget> mess = [];
          for (var message in messages) {
            final mesagetext = message.data()['text'];
            final mesagesend = message.data()['sender'];
            final messw  =  MessageBublle(sender: mesagesend==null?'':mesagesend , message: mesagetext==null?'':mesagetext);
            mess.add(messw);
          }
          puck = mess;
        }
        return Expanded(
          child: ListView(
            children: puck,
          ),
        );
      },
    );

  }
}
