library excel_kit;

import 'dart:io';

import 'package:excel/excel.dart';
import 'package:excel_kit/excel.dart';

const _fileExtList = ["xlsx"];

class ExcelKit {
  ExcelKit._();

  static IExcel readFile(String path) {
    var pathArr = path.split(".");
    var fileExt = pathArr[pathArr.length - 1];

    if (!_fileExtList.contains(fileExt)) {
      throw ".$fileExt file not supported";
    }

    var fileByte = File(path).readAsBytesSync();
    var excelIns = Excel.decodeBytes(fileByte);

    var sheetMap = excelIns.sheets;

    return IExcel(sheetMap);
  }
}
