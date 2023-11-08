import 'package:hive/hive.dart';

class LocalStorageService<T> {
  String boxName;
  LocalStorageService(this.boxName);
  Box<T>? box;

  Future openBox() async {
    box = await Hive.openBox<T>(boxName);
  }

  Future closeBox() async {
    await box?.close();
  }

  Future<void> add(value, {key, index}) async {
    await openBox();

    if (key == null && index == null) {
      _addWithoutKeyOrIndex(value);
    } else if (key != null) {
      _addWithKey(value, key);
    } else {
      _addToIndex(value, index);
    }
    await closeBox();
  }

  Future<void> update(boxName, value, {key, index}) async {
    await openBox();

    if (key != null) {
      _updateWithKey(value, key);
    } else {
      _updateAtIndex(value, index);
    }
    await closeBox();
  }

  Future delete(boxName, {index, key}) async {
    await openBox();

    if (key != null) {
      await deleteWithKey(key);
    } else if (index != null) {
      await deleteWithIndex(index);
    } else {
      await deleteAll();
    }
    await closeBox();
  }

  Future<bool> checkIfExists(key) async {
    await openBox();

    T? data = await getWithKey(key);
    if (data == null) {
      await closeBox();

      return false;
    } else {
      await closeBox();
      return true;
    }
  }

  Future<void> _addWithoutKeyOrIndex(value) async {
    box!.add(value);
  }

  Future<void> _addWithKey(value, key) async {
    box!.put(key, value);
  }

  Future<void> _addToIndex(value, index) async {
    box!.putAt(index, value);
  }

  Future<void> _updateWithKey(value, key) async {
    box!.put(key, value);
  }

  Future<void> _updateAtIndex(value, index) async {
    box!.putAt(index, value);
  }

  Future<List<T>> getAll() async {
    await openBox();

    return box!.values.toList();
  }

  Future<T?> getWithKey(key) async {
    await closeBox();
    await openBox();

    return box!.get(key);
  }

  Future getWithIndex(index) async {
    return box!.getAt(index);
  }

  Future deleteAll() async {
    return box!.clear();
  }

  Future deleteWithKey(key) async {
    return await box!.delete(key);
  }

  Future deleteWithIndex(index) async {
    return await box!.deleteAt(index);
  }
}
