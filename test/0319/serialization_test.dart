import 'dart:convert';
import 'dart:io';

import 'package:learn_dart_together/0319/department.dart';
import 'package:learn_dart_together/0319/employee.dart';
import 'package:test/test.dart';

void main() {
  test('객체를 JSON 형식으로 변환 후 파일에 쓰기', () {
    Employee leader = Employee('홍길동', 41);
    Department department = Department('General Affairs', leader);
    final myFile = File('/Users/leeseowoo/git/learn_dart_together/test/0319/json_test.txt');
    String jsonString = jsonEncode(department.toJson());

    myFile.writeAsStringSync(jsonString);

    expect(myFile.readAsStringSync(), jsonString);
  });
}