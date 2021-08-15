// Cores
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  static final SharedPreferencesServices _singleton =
      SharedPreferencesServices._internal();
  late SharedPreferences prefInstance;

  factory SharedPreferencesServices() {
    return _singleton;
  }

  SharedPreferencesServices._internal();

  Future<void> initPrefInstance() async {
    prefInstance = await SharedPreferences.getInstance();
  }
}
