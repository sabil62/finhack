import 'package:flutter/material.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int indexstack = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IndexedStack(
            index: indexstack,
            children: [
              Container(
                child: Text('0 stack'),
              ),
              Container(
                child: Text('1 stack'),
              ),
              Container(
                child: Text('2 stack'),
              ),
              Container(
                child: Text('3 stack'),
              ),
              Container(
                child: Text('4 stack'),
              ),
            ],
          ),
          Divider(
            height: 30,
            thickness: 2,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  indexstack = indexstack < 4 ? indexstack + 1 : 0;
                });
              },
              child: Text(indexstack.toString()))
        ],
      ),
    );
  }
}
