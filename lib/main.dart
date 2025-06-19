import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String data  ="";
  dynamic testApi() async {
    var url = "https://jsonplaceholder.typicode.com/todos/2";  
    
    var response  = await http.get(Uri.parse(url));
    var title = jsonDecode(response.body)["title"];

    return title;

    // return response.body;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body:Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(data),
              ElevatedButton(onPressed:() async{
                data = await testApi();
                setState(() {
                  data = data;
                });

              }, child: Text("Test API"))
            ],
          ),
        )
      )
    );
  }
}