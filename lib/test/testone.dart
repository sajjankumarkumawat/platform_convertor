import 'package:flutter/material.dart';
import 'package:platform_convertor/chats_screen.dart';
import 'package:platform_convertor/test/testone.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textController = TextEditingController();
  List<String> names = [];

  void _addName() {
    setState(() {
      names.add(textController.text);
      textController.clear();
    });
  }

  void _navigateToNameListPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NameListPage(names: names),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: textController,
            ),
            ElevatedButton(
              onPressed: _addName,
              child: Text('Add Name'),
            ),
            ElevatedButton(
              onPressed: names.isEmpty ? null : _navigateToNameListPage,
              child: Text('Go to Name List Page'),
            ),
          ],
        ),
      ),
    );
  }
}
