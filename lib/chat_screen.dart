import 'package:chatapp/chat_message.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget{
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen>{

final TextEditingController _textEditingController=new TextEditingController();
final List<ChatMessage> _messages=<ChatMessage>[];
void _handleSubmitted(String text){
  _textEditingController.clear();
  ChatMessage message=new ChatMessage(text: text);
  setState(() {
    _messages.insert(0, message);
  });
}

  Widget _textComposerWidget(){
    return new IconTheme(
      data: new IconThemeData(color: Colors.blue),
          child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
            child: new TextField(
              decoration: new InputDecoration.collapsed(
                hintText: "Type Here..."
              ),
              controller: _textEditingController,
              onSubmitted: _handleSubmitted,
            )
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textEditingController.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (context,int index)=>_messages[index],
              itemCount: _messages.length,
            ),
          ),
          new Divider(height: 1.0),
          new Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).cardColor,

            ),
            child: _textComposerWidget(),
          )

        ],
      );
  }
}