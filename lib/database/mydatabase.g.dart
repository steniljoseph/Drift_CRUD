// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mydatabase.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class EmployeeData extends DataClass implements Insertable<EmployeeData> {
  final int id;
  final String name;
  final String job;
  final String place;
  const EmployeeData(
      {required this.id,
      required this.name,
      required this.job,
      required this.place});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['job'] = Variable<String>(job);
    map['place'] = Variable<String>(place);
    return map;
  }

  EmployeeCompanion toCompanion(bool nullToAbsent) {
    return EmployeeCompanion(
      id: Value(id),
      name: Value(name),
      job: Value(job),
      place: Value(place),
    );
  }

  factory EmployeeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmployeeData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      job: serializer.fromJson<String>(json['job']),
      place: serializer.fromJson<String>(json['place']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'job': serializer.toJson<String>(job),
      'place': serializer.toJson<String>(place),
    };
  }

  EmployeeData copyWith({int? id, String? name, String? job, String? place}) =>
      EmployeeData(
        id: id ?? this.id,
        name: name ?? this.name,
        job: job ?? this.job,
        place: place ?? this.place,
      );
  @override
  String toString() {
    return (StringBuffer('EmployeeData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('job: $job, ')
          ..write('place: $place')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, job, place);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmployeeData &&
          other.id == this.id &&
          other.name == this.name &&
          other.job == this.job &&
          other.place == this.place);
}

class EmployeeCompanion extends UpdateCompanion<EmployeeData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> job;
  final Value<String> place;
  const EmployeeCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.job = const Value.absent(),
    this.place = const Value.absent(),
  });
  EmployeeCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String job,
    required String place,
  })  : name = Value(name),
        job = Value(job),
        place = Value(place);
  static Insertable<EmployeeData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? job,
    Expression<String>? place,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (job != null) 'job': job,
      if (place != null) 'place': place,
    });
  }

  EmployeeCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? job,
      Value<String>? place}) {
    return EmployeeCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      job: job ?? this.job,
      place: place ?? this.place,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (job.present) {
      map['job'] = Variable<String>(job.value);
    }
    if (place.present) {
      map['place'] = Variable<String>(place.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmployeeCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('job: $job, ')
          ..write('place: $place')
          ..write(')'))
        .toString();
  }
}

class $EmployeeTable extends Employee
    with TableInfo<$EmployeeTable, EmployeeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmployeeTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  final VerificationMeta _jobMeta = const VerificationMeta('job');
  @override
  late final GeneratedColumn<String> job = GeneratedColumn<String>(
      'job', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  final VerificationMeta _placeMeta = const VerificationMeta('place');
  @override
  late final GeneratedColumn<String> place = GeneratedColumn<String>(
      'place', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, job, place];
  @override
  String get aliasedName => _alias ?? 'employee';
  @override
  String get actualTableName => 'employee';
  @override
  VerificationContext validateIntegrity(Insertable<EmployeeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('job')) {
      context.handle(
          _jobMeta, job.isAcceptableOrUnknown(data['job']!, _jobMeta));
    } else if (isInserting) {
      context.missing(_jobMeta);
    }
    if (data.containsKey('place')) {
      context.handle(
          _placeMeta, place.isAcceptableOrUnknown(data['place']!, _placeMeta));
    } else if (isInserting) {
      context.missing(_placeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EmployeeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmployeeData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      job: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}job'])!,
      place: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}place'])!,
    );
  }

  @override
  $EmployeeTable createAlias(String alias) {
    return $EmployeeTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $EmployeeTable employee = $EmployeeTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [employee];
}
