import 'package:flutter/material.dart';
class MyHomepage extends StatefulWidget {
  int id;
  int userId;
  String title;
   MyHomepage({
    required this.id,required this.userId,required this.title,
    
    
    super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Data'),),
      body: Center(
        child: Container(height: 100,color: Colors.lightGreen,
          child: Column(
            children: [
              ListTile(leading: CircleAvatar(child: Text(' id\n${widget.id.toString()}')),
              subtitle: Text('title : ${widget.title}'),
              title: Text('user id : ${widget.userId.toString()}'),),
              
            ],
          )),
      ),
    );
  }
}