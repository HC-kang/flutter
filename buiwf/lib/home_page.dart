import 'package:buiwf/chat_massage.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textEditingController = TextEditingController();

  List<ChatMessage> _chats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return _chats[index];
            },
            itemCount: _chats.length,
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: '메시지를 입력하세요.',
                    ),
                    onSubmitted: _handlesSubmitted,
                  ),
                ),
                //TextField는 기본값 크기가 없기때문에, Expanded로 감싸주지 않으면 오류 발생
                SizedBox(
                  width: 8.0,
                ),
                FlatButton(
                  onPressed: () {
                    _handlesSubmitted(_textEditingController.text);
                  },
                  child: Text('Send'),
                  color: Colors.amberAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handlesSubmitted(String text) {
    Logger().d(text);

    setState(() {
      ChatMessage newChat = ChatMessage(text);
      _chats.add(newChat);
    });

    _textEditingController.clear();
  }
}
//
