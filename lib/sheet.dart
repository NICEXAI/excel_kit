class SheetOption {
  late String name;
  late List<Map> dataList;
  late Map<String, String>? fieldMap;

  SheetOption(this.name, this.dataList, {this.fieldMap});
}

class ISheet {
  late List<String> _fieldList;
  late List<Map> _dataList;

  ISheet(List<String> fieldList, List<Map> dataList) {
    _fieldList = fieldList;
    _dataList = dataList;
  }

  List<String> getFieldList() {
    return _fieldList;
  }

  List<Map> getDataList() {
    return _dataList;
  }
}
