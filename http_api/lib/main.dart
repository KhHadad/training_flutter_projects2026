import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool loading = false;
  List mapNames=[
    "id",
    "title",
    "body",
    "tags",
    "reactions",
    "views",
    "userId"
  ];

  Map data={};
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('API'),
        centerTitle: true,),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: MaterialButton(
                 color: Colors.cyan,
              textColor: Colors.white,
              onPressed: () async{
                   loading=true;
                   setState(() {

                   });
               var response =await get(Uri.parse('https://dummyjson.com/posts/1')) ;
               print(response.body);
               var mapResponse = jsonDecode(response.body);
               data.addAll(mapResponse);
               loading=false;
               setState(() {
                 
               });

              },child: Text('http requuest')),
            ),
            if(loading)Center(child: CircularProgressIndicator(),),
            ...List.generate(data.length, (index) {
              return Container(
                padding: EdgeInsets.all(20),
                  child: Text('${mapNames[index]} : ${data[mapNames[index]]}',
                  style: TextStyle(fontSize: 19),),
              );
            }
            )

          ],
        ),
      ),
    );
  }
}
