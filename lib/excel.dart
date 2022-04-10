import 'package:excel/excel.dart';
import 'package:excel_kit/sheet.dart';

class IExcel {
  late Map<String, Sheet> _sheetMap;

  IExcel(Map<String, Sheet> sheetMap) {
    _sheetMap = sheetMap;
  }

  ISheet getSheet(String name, Map? fieldMap) {
    var sheet = _sheetMap[name];

    if (sheet == null) {
      throw "sheet $name not exist";
    }

    var fieldDict = {};
    if(fieldMap != null) {
      for(var key in fieldMap.keys) {
        fieldDict[fieldMap[key]] = key;
      }
    }

    List<String> fieldList = [];
    List<Map> dataList = [];
    var fieldIndexMap = {};

    for (var i = 0; i < sheet.rows.length; i++) {
      var row = sheet.rows[i];

      // parse field
      if(i == 0) {
        for (var j = 0; j < row.length; j++) {
          var info = row[j];
          var value = info?.value;

          if (value != null && fieldDict[value] != null) {
            fieldIndexMap[j] = fieldDict[value];
          } else {
            fieldIndexMap[j] = value;
          }

          fieldList.add(value);
        }
        continue;
      }

      // parse data
      var data = {};

      for (var j = 0; j < row.length; j++) {
        var info = row[j];
        var value = info?.value;

        if(fieldIndexMap[j] == null) {
          continue;
        }

        data[fieldIndexMap[j]] = value;
      }

      dataList.add(data);
    }

    return ISheet(fieldList, dataList);
  }
}
