import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_in_api/view/homepage.dart';

import 'package:provider_in_api/provider/todo/todo_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => TodoProvider(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Homepage() ,
    ),
    
    
    );
    
  }
}

