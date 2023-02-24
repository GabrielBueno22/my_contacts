import 'package:hive/hive.dart';
import 'package:my_contacts/utils/interfaces/ilocal_db.dart';

class HiveDb implements ILocalDB {
  HiveDb() {
    Hive.init(null);
  }

  @override
  Future<void> delete(String path, String key) async {
    var box = await Hive.openBox(path);
    box.delete(key);
  }

  @override
  Future<List> getAll(String path) async {
    var box = await Hive.openBox(path);
    return box.values.toList();
  }

  @override
  Future<void> save(String path, String key, {Object? value}) async {
    var box = await Hive.openBox(path);
    box.add(value);
  }
}
