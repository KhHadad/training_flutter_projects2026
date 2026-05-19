
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:permission_handler/permission_handler.dart';

class ExcelFiles {

  void createExcelFile(List<List<dynamic>> products, String fileName) {
    final excel = Excel.createExcel();
    final sheet = excel['Sheet1'];

    sheet.appendRow([
      TextCellValue('اسم المنتج'),
      TextCellValue('السعر'),
    ]);

    for (var product in products) {
      sheet.appendRow([
        TextCellValue(product[0].toString()),
        TextCellValue(product[1].toString()),
      ]);
    }

    saveExcel(excel, fileName);
  }

  saveExcel(Excel excel, String fileName) async {
    var status = await Permission.storage.status;

    if (!status.isGranted) {
      await Permission.storage.request();
    }

    var fileBytes = await excel.save();

    File('/storage/emulated/0/Documents/$fileName.xlsx')
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);
  }

  Future<List<List<dynamic>>?> pickAndImportExcel(
      BuildContext context) async {

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx', 'xls'],
      );

      if (result == null || result.files.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('لم يتم اختيار أي ملف'),
            backgroundColor: Colors.red,
          ),
        );

        return null;
      }

      final filePath = result.files.single.path!;
      final file = File(filePath);

      final bytes = await file.readAsBytes();

      final excel = Excel.decodeBytes(bytes);

      final sheet = excel.tables.values.first;

      List<List<dynamic>> products = [];

      for (int i = 0; i < sheet.rows.length; i++) {
        final row = sheet.rows[i];

        final rowValues =
        row.map((cell) => cell?.value).toList();

        products.add(rowValues);
      }

      return products;

    } catch (e) {
      debugPrint('خطأ أثناء الاستيراد: $e');
      return null;
    }
  }
}