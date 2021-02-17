import 'package:eStore/routes/index.dart';

class StorageService {
  static Future<void> saveToPreferences(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<String> getFromPreferences(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return Future<String>.value(prefs.getString(key) ?? '');
    } catch (e) {
      print(e);
      return '';
    }
  }

  static Future<void> removePreferences(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
