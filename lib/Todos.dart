import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo({this.userId, this.id, this.title, this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed']
    );
  }
}

class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Todo>>(
      future: _fetchTodo(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Todo> data = snapshot.data;
          return todoListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<List<Todo>> _fetchTodo() async {

    final apiUrl = 'https://jsonplaceholder.typicode.com/todos';
    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((todo) => new Todo.fromJson(todo)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  // ignore: non_constant_identifier_names
  ListView todoListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index].title, data[index].completed);
        });
  }

  ListTile _tile(String title, bool completed) => ListTile(
    title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(completed.toString()),
  );
}