import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/rendering.dart';
import 'package:practice_chat_app/Messages.dart';
import 'package:practice_chat_app/Status.dart';
import 'models/Category_Selector.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> with TickerProviderStateMixin

     {
  @override
  Widget build(BuildContext context) {
    TabController tabController = new TabController(length: 3, vsync: this);
    final ThemeData _themeData = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          child: new Icon(Icons.message),
          backgroundColor: _themeData.primaryColor,
          onPressed: () {}),
      backgroundColor: _themeData.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:8 ,horizontal:15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.list,
                            color: Colors.white,
                          ),
                          Text('Chatbox',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                          Icon(
                            Icons.camera,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height:5,
                    ),
                    Container(
                      height: 35,
                      child:myTab(
                        tabController: tabController,
                      )

                    )
                  ],
                ),

                //  MyTabBar(tabController: tabController),
              ),
            ),
            Expanded(
                flex: 6,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15))),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Messages(),
                     Status(),
                      Icon(Icons.games),
                    ],
                  )
                )
            ),
          ],
        ),
      ),
    );
  }
}
