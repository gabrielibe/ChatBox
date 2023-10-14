import 'package:flutter/material.dart';
import 'models/MessagesModel.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  List<MessageBlock> Messages = [
    MessageBlock(
      sender: 'hannah',
      message: 'you\'ll never catch me in the next mans sweater ',
      img: AssetImage('nkydnwsik'),
      time: '21:22',
      isread: true,
    ),
    MessageBlock(
      sender: 'hannah',
      message: 'you\'ll never catch me in the next mans sweater ',
      img: AssetImage('nkydnwsik'),
      time: '21:22',
      isread: false,
    ),
    MessageBlock(
      sender: 'hannah',
      message: 'you\'ll never catch me in the next mans sweater ',
      img: AssetImage('nkydnwsik'),
      time: '21:22',
      isread: false,
    ),
    MessageBlock(
      sender: 'hannah',
      message: 'you\'ll never catch me in the next mans sweater ',
      img: AssetImage('nkydnwsik'),
      time: '21:22',
      isread: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 0, left: 15, right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Recent Chats',
                style: TextStyle(
                    color: Colors.lightBlueAccent, fontWeight: FontWeight.w700),
              ),
              Icon(Icons.search, color: Colors.lightBlueAccent),
            ],
          ),
          ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: Messages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  //onTap: Navigator.push(context, );
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.lightBlueAccent,
                            radius: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Messages[index].sender,style:TextStyle(
                                fontSize: 15,
                              )),
                               SizedBox(
                               //  height: 3,
                               ),
                               Container(
                                   width:MediaQuery.of(context).size.width*0.3,
                                   child: Text(Messages[index].message,
                                       overflow: TextOverflow.ellipsis,
                                       style : TextStyle(
                                     color: Colors.grey,
                                     fontSize: 13,
                                   ))
                               ),
                            ],
                          ),
SizedBox(
  width:   MediaQuery.of(context).size.width*0.3,
)
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor:Messages[index].isread?Colors.white : Colors.lightBlueAccent,
                            radius: 3,
                          ),
                          Text(Messages[index].time),

                        ],
                      ),
                      SizedBox(
                        height: 60,
                      )
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
