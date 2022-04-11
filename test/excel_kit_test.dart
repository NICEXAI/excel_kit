import 'dart:convert';
import 'package:path/path.dart' as path;

import 'package:excel_kit/sheet.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:excel_kit/excel_kit.dart';

void main() {
  test("Read xlsx file", () {
    String readPath = path.canonicalize(path.join(path.current, "test/resource/read_test.xlsx"));

    Map<String, String> fieldMap = {
      "id": "ID",
      "name": "Name",
      "age": "Age",
    };

    // get sheet content
    var sheet = ExcelKit.readFile(readPath).getSheet("Sheet1", fieldMap: fieldMap);

    // get title list
    var fieldList = sheet.getFieldList();
    print(jsonEncode(fieldList));

    // get data list
    var dataList = sheet.getDataList();
    print(jsonEncode(dataList));
  });

  test("Write xlsx file", () {
    String writePath = path.canonicalize(path.join(path.current, "test/resource/write_test.xlsx"));

    List<Map> dataList = [
      {
        "id": 1,
        "name": "user1",
        "age": 12
      },
      {
        "id": 2,
        "name": "user2",
        "age": 15
      }
    ];

    Map<String, String> fieldMap = {
      "id": "ID",
      "name": "Name",
      "age": "Age",
    };

    ExcelKit.writeFile(writePath, [SheetOption("Sheet1", dataList, fieldMap: fieldMap)]);
  });
}
