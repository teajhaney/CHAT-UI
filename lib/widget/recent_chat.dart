import 'package:chat_ui/models/message_model.dart';
import 'package:chat_ui/models/user_model.dart';
import '../screens/conversation.dart';

import 'package:flutter/material.dart';

class RecentChat extends StatelessWidget {
  final User user;

  RecentChat({this.user});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: ListView.separated(
          itemCount: chats.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Conversation(
                    user: chats[index].sender,
                  ),
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 5, bottom: 5, right: 20, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            chats[index].sender.imageUrl,
                          ),
                        ),
                        SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chats[index].sender.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                chats[index].text,
                                style: TextStyle(
                                    color: chats[index].unread
                                        ? Theme.of(context).accentColor
                                        : Colors.black38,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          chats[index].time,
                          style: TextStyle(
                            color: Colors.black38,
                          ),
                        ),
                        SizedBox(height: 5),
                        chats[index].unread
                            ? Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor:
                                      Theme.of(context).accentColor,
                                ),
                              )
                            : Text(''),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
