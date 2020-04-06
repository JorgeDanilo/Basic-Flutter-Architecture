import 'package:meu_bolso_seguro_mobile/db/db_helper.dart';
import 'package:meu_bolso_seguro_mobile/db/entity.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseDAO<T extends Entity> {

Future<Database> get db => DatabaseHelper.getInstance().db;
String get tableName;
T fromMap(Map<String,dynamic> map);

Future<int> save(T entity) async {
  var dbClient = await db;
  var id = await dbClient.insert(tableName, entity.toMap(),  conflictAlgorithm: ConflictAlgorithm.replace);
  return id;
}

Future<List<T>> findAll() async {
  final dbClient = await db;
  final list = await dbClient.rawQuery('select * from $tableName');
  return list.map<T>((json) => fromMap(json)).toList();
}

Future<T> findById(int id) async {
  var dbClient = await db;
  final list =
  await dbClient.rawQuery('select * from $tableName where id = ?', [id]);
  if (list.length > 0)
    return fromMap(list.first);
  return null;
}

Future<bool> exists(int id) async {
  T c = await findById(id);
  var exists = c != null;
  return exists;
}

Future<int> count() async {
  final dbClient = await db;
  final list = await dbClient.rawQuery('select count(*) from $tableName');
  return Sqflite.firstIntValue(list);
}

Future<int> delete(int id) async {
  var dbClient = await db;
  return await dbClient.rawDelete('delete from $tableName where id = ?', [id]);
}

Future<int> deleteAll() async {
  var dbClient = await db;
  return await dbClient.rawDelete('delete from $tableName');
}

Future<List<T>> query(String sql, [List<dynamic> arguments]) async {
  var dbClient = await db;
  final list = await dbClient.rawQuery(sql, arguments);
  return list.map<T>((json) => fromMap(json)).toList();
}

}