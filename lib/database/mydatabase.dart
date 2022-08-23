import 'dart:io';

import 'package:demo/database/employee.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'mydatabase.g.dart';

@DriftDatabase(tables: [Employee])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;

  Stream<List<EmployeeData>> getEmployees() => select(employee).watch();

  Future<EmployeeData> getEmployee(int id) async =>
      await (select(employee)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future updateEmployee(EmployeeCompanion entity) =>
      update(employee).replace(entity);

  Future<void> insertEmployee(EmployeeCompanion entity) async =>
      await into(employee).insert(entity);

  Future deleteEmployee(int id) async =>
      await (delete(employee)..where((tbl) => tbl.id.equals(id))).go();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
