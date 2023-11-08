import 'package:hive/hive.dart';

class HiveHelper<T> {
  String boxName;
  HiveHelper(this.boxName);
  late Box<T> box;

  openBox() async {
    box = await Hive.openBox<T>(boxName);
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
  }

  Future<void> update(boxName, value, {key, index}) async {
    await openBox();

    if (key != null) {
      _updateWithKey(value, key);
    } else {
      _updateAtIndex(value, index);
    }
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
  }

  Future<bool> checkIfExists(key) async {
    await openBox();

    T? data = await getWithKey(key);
    if (data == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> _addWithoutKeyOrIndex(value) async {
    await openBox();

    box.add(value);
  }

  Future<void> _addWithKey(value, key) async {
    await openBox();

    box.put(key, value);
  }

  Future<void> _addToIndex(value, index) async {
    await openBox();

    box.putAt(index, value);
  }

  Future<void> _updateWithKey(value, key) async {
    await openBox();

    box.put(key, value);
  }

  Future<void> _updateAtIndex(value, index) async {
    await openBox();

    box.putAt(index, value);
  }

  Future<List<T>> getAll() async {
    await openBox();

    return box.values.toList();
  }

  Future<T?> getWithKey(key) async {
    await openBox();

    return box.get(key);
  }

  Future getWithIndex(index) async {
    await openBox();

    return box.getAt(index);
  }

  Future deleteAll() async {
    await openBox();

    return box.clear();
  }

  Future deleteWithKey(key) async {
    await openBox();

    return await box.delete(key);
  }

  Future deleteWithIndex(index) async {
    await openBox();

    return await box.deleteAt(index);
  }
}
