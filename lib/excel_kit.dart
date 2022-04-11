library excel_kit;

import 'dart:io';

import 'package:excel/excel.dart';
import 'package:excel_kit/excel.dart';
import 'package:excel_kit/sheet.dart';

bool checkFileExt(String path) {
  var pathArr = path.split(".");
  var fileExt = pathArr[pathArr.length - 1];

  return ["xlsx"].contains(fileExt);
}

class ExcelKit {
  ExcelKit._();

  static IExcel readFile(String path) {
    if (!checkFileExt(path)) {
      throw "file not supported";
    }

    var fileByte = File(path).readAsBytesSync();
    var excelIns = Excel.decodeBytes(fileByte);

    var sheetMap = excelIns.sheets;

    return IExcel(sheetMap);
  }

  static writeFile(String path, List<SheetOption> sheetOptions) {
    if (!checkFileExt(path)) {
      throw "file not supported";
    }

    Excel excel = Excel.createExcel();
    for (var sheetOption in sheetOptions) {
      Sheet sh = excel[sheetOption.name];

      if (sheetOption.dataList.isEmpty) {
        continue;
      }

      // generate title row
      Map title = {};

      for (var key in sheetOption.dataList[0].keys) {
        if (sheetOption.fieldMap != null && sheetOption.fieldMap![key] != null) {
          title[key] = sheetOption.fieldMap![key];
        } else {
          title[key] = key;
        }
      }

      sh.insertRowIterables(title.values.toList(), 0);

      for (var i = 0; i < sheetOption.dataList.length; i++) {
        Map data = sheetOption.dataList[i];
        sh.insertRowIterables(data.values.toList(), i + 1);
      }
    }

    var sheetByte = excel.encode();
    File(path)
      ..createSync(recursive: true)
      ..writeAsBytesSync(sheetByte!);
  }
}
