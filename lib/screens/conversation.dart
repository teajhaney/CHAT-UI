import 'package:chat_ui/models/message_model.dart';
import '../models/user_model.dart';
import 'package:flutter/material.dart';

class Conversation extends StatefulWidget {
  final User user;

  Conversation({this.user});
  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  _buildMessage(Message message, bool isMe) {
    return Container(
      margin: isMe
          ? EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80,
            )
          : EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              right: 80,
            ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: isMe
          ? BoxDecoration(
              color: isMe ? Theme.of(context).accentColor : Colors.blue[50],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            )
          : BoxDecoration(
              color: isMe ? Theme.of(context).accentColor : Colors.blue[50],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.time,
            style: isMe
                ? TextStyle(color: Colors.white)
                : TextStyle(color: Colors.black54),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            message.text,
            style: isMe
                ? TextStyle(color: Colors.white)
                : TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      height: 70,
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.camera),
            iconSize: 30,
            color: Colors.blue[100],
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration:
                  InputDecoration.collapsed(hintText: 'Send a message...'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send_sharp),
            iconSize: 30,
            color: Theme.of(context).accentColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.video_call),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.call),
            onPressed: null,
          ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.user.name,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Online now',
              style: TextStyle(color: Colors.green, fontSize: 10),
            )
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Yesterday',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
            Expanded(
              child: Container(
                  child: ListView.builder(
                      reverse: true,
                      scrollDirection: Axis.vertical,
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Message message = messages[index];
                        final bool isMe = message.sender.id == currentUser.id;
                        return Padding(
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          child: _buildMessage(message, isMe),
                        );
                      })),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
