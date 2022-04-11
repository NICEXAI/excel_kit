# ExcelKit

An easy-to-use excel kit.

## Getting started

### 1. Depend on it
Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  excel_kit: ^1.0.0-null-safety-1
```

### 2. Install it

You can install packages from the command line:

with `pub`:

```shell
$  pub get
```

with `Flutter`:

```shell
$  flutter packages get
```

### 3. Import it

Now in your `Dart` code, you can use: 

```dart
    import 'package:excel_kit/excel_kit.dart';
```

## Usage

### Read xlsx file:

```dart
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
```

print:

```
title: ["ID","Name","Age"]
data: [{"id":1,"name":"user1","age":12},{"id":2,"name":"user2","age":15}]
```

### Write xlsx file:

```dart
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
```

## Special Thanks

Thanks for [justkawal/excel](https://github.com/justkawal/excel).
