import 'package:drift/drift.dart';

class Employee extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 3, max: 32)();
  TextColumn get job => text().withLength(min: 3, max: 32)();
  TextColumn get place => text().withLength(min: 3, max: 32)();
}
