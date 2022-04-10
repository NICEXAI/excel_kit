import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:excel_kit/excel_kit.dart';

void main() {
  test('test method is ok', () {
    const path = "C:/Users/15005/Desktop/夜莺.xlsx";
    var fieldMap = {
      "id": "ID",
      "gender": "性别",
      "age": "年龄",
      "work": "工作经历",
      "post": "岗位",
      "workingTime": "在职时间",
      "education": "教育经历",
      "major": "专业",
      "activeTime": "活跃时间",
      "activeStatus": "在职状态"

    };
    var excel = ExcelKit.readFile(path);
    var sheet = excel.getSheet("Sheet1", fieldMap);
    var dataList = sheet.getDataList();
    print(jsonEncode(dataList));
  });
}
