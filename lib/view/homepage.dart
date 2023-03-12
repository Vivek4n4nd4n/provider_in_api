import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_in_api/provider/todo/todo_provider.dart';
import 'package:provider_in_api/view/my_home_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(255, 236, 225, 193),
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 1,
        title: const Text('Provider Api'),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, value, child) {
          final todos = value.todos;
          return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                // final  todo = todos[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(tileColor: todos[index].completed ? Color.fromARGB(255, 213, 243, 178) : Colors.white,
                    leading:
                        CircleAvatar(backgroundColor: Color.fromARGB(255, 240, 226, 233),
                          child: Text(todos[index].id.toString())),
                    subtitle: Text(
                      'Title :\n ${todos[index].title}',
                      style: TextStyle(
                          color: todos[index].completed
                              ? Colors.black
                              : Colors.grey),
                    ),
                  title: Text('user id : ${todos[index].userId.toString()}'),
                    trailing: TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomepage(id: todos[index].id,
                 title: todos[index].title ,userId: todos[index].userId,)));
                    }, child: const Text('Click here')),
                  ),
                );
              });
        },
      ),
    );
  }
}

