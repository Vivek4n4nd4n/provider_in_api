import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider_in_api/main.dart';
import 'package:provider_in_api/model/todo.dart';

class TodoServices {
  Future<List<Todo>> getAll() async {
    const url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return Todo(
            id: e['id'],
            userId: e['userId'],
            title: e['title'],
            completed: e['completed']);
      }).toList();
      return todos;
    }
    return [];
    //throw 'some thing went wrong';
  }
}
