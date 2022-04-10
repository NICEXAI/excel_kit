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
