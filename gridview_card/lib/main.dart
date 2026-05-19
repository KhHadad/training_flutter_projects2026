import 'package:flutter/material.dart';

import 'lists.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text('notes'),),
        backgroundColor: Colors.cyan,),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: monthInfo.length,
            itemBuilder: (context,i){
              return Card(
                child: ListTile(
                  leading: Text('${i+1}'),
                  title: Text('${monthInfo[i]['name']}'),
                  subtitle: Text('${monthInfo[i]['subtitle']}'),
                  trailing:Icon(Icons.star),

                ),
              );
            }),
      ),
    );
  }
}
