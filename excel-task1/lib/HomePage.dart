
import 'package:flutter/material.dart';

import 'HandlingExcelFiles.dart';
import 'productPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<dynamic>>  productsToSave = [];
  TextEditingController fileName= TextEditingController();
  TextEditingController productName= TextEditingController();
  TextEditingController price= TextEditingController();
  ExcelFiles excelObject = new ExcelFiles();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Welcome to our Store'),),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: fileName,
              decoration: InputDecoration(
                  labelText: 'file Name',
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 16,),

            TextFormField(
              controller: productName,
              decoration: InputDecoration(
                  labelText: ' Product Name',
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 16,),

            TextFormField(
              controller: price,
              decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () {
                if (productName.text.isEmpty || price.text.isEmpty) return;

                setState(() {
                  productsToSave.add([
                    productName.text,
                    price.text,
                  ]);
                });

                productName.clear();
                price.clear();
              },
              child: Text('add product to file'),
            ),

            SizedBox(height: 12,),

            ElevatedButton(
              onPressed: () {
                if (productsToSave.isEmpty) return;

                // إنشاء الملف بكل المنتجات
                excelObject.createExcelFile(productsToSave, fileName.text);


                setState(() {
                  productsToSave.clear();
                });
                clear();
              },
              child: Text('create an excel file'),
            ),
            SizedBox(height: 12,),

            ElevatedButton(
                onPressed: () async {
                  final result = await excelObject.pickAndImportExcel(context);

                  if (result != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => productPage(products: result),
                      ),
                    );
                  } else {
                    print('no information');
                  }
                },
                child: Text('Choose a file ')
            )

          ],
        ),
      ),
    );

  }
  void clear(){
    fileName.clear();
    productName.clear();
    price.clear();
  }
}
