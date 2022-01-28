import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multiavatar/multiavatar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MultiAvatar exemple',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'MultiAvatar Exemple'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.string(_controller.text,height: 50,
            width: 50,),
            SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              onPressed: () {
                ///The svg code
                setState(() {
                  _controller.text =
                      multiavatar(DateTime.now().toIso8601String(),
                      radius: 10);
                });
                log(_controller.text);
              },
              tooltip: 'Generate',
              child: Icon(Icons.gesture),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
              ),
              maxLines: 20,
            )
          ],
        ),
      ),
    );
  }
}
