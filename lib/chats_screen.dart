
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor/app_const.dart';

class NameListPage extends StatelessWidget {
  final List<String> names;

  NameListPage({Key? key, required this.names}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(name[index]),
          );
        },
      ),
    );
  }
}