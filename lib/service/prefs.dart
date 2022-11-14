import 'dart:developer';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class GetPrefs extends GetxService {
  late final GetStorage box;
  static final _insance = GetPrefs.init();
  GetPrefs.init() {
    box = GetStorage();
  }

  factory GetPrefs() => _insance;

  Future<bool?> saveData<T>({required String? key, required T data}) async {
    var saved = false;
    try {
      await box.write(key!, data);
      saved = true;
      return saved;
    } catch (e) {
      log(e.toString());
    }
    return saved;
  }

  Future<T?> loadDataFromStorage<T>({required String key}) async {
    try {
      return box.read<T>(key);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<bool?> removeData({required String key}) async {
    var removed = false;
    try {
      await box.remove(key);
      removed = true;
      return removed;
    } catch (e) {
      log(e.toString());
    }
    return false;
  }
}
