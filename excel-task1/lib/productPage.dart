
import 'package:flutter/material.dart';

class productPage extends StatelessWidget {
 final List<List<dynamic>> products;
  const productPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child:Text('المنتجات') ,)
      ,backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final row = products[index];

          return ListTile(
            title: Text(row.isNotEmpty ? row[0].toString() : ''),
            subtitle: Text(row.length > 1 ? row[1].toString() : ''),
          );
        },
      ),
    );
  }
}
