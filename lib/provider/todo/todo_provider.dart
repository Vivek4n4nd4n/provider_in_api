import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:provider_in_api/model/todo.dart';
import 'package:provider_in_api/services/todo_services.dart';

class TodoProvider extends ChangeNotifier{
final _service = TodoServices();
bool isLoading = false;
List <Todo> _todos =[];
List <Todo> get todos => _todos;

Future <void> getAllTodos()async{
  isLoading= true;
  notifyListeners();
  
  final response =await _service.getAll();
  _todos = response;
  isLoading = false;
  notifyListeners();
}



 }