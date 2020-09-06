import 'package:flutter/material.dart';
import 'package:kinetics_task/ThirdScreen.dart';
import 'Todos.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Center(
          child: new Text("First Screen",
            textAlign: TextAlign.center,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => ThirdScreen()));
            },
          )
        ],
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: TodoListView()
      ),
    );
  }
}
