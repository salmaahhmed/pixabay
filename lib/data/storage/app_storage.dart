import 'package:injectable/injectable.dart';
import 'package:pixabay_task/data/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: Storage)
class AppStorage implements Storage {
  final SharedPreferences _preferences;

  AppStorage(this._preferences);

  final String _isLoggedIn = 'isLoggedIn';

  @override
  Future<bool> isLoggedIn() async {
    return _preferences.getBool(_isLoggedIn) ?? false;
  }

  @override
  Future<void> login() async {
    await _preferences.setBool(_isLoggedIn, true);
  }
}
