import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NameListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final names = ModalRoute.of(context)?.settings.arguments as List<String>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Submitted Names'),
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(names[index]),
          );
        },
      ),
    );
  }
}