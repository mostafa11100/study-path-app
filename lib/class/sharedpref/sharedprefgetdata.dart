import 'package:shared_preferences/shared_preferences.dart';

class Sharedprefgetdata {
  static SharedPreferences? pref;
  static Future<String?> getstring(key) async {
    pref = await SharedPreferences.getInstance();
    String? uid = pref!.getString(key);
    return uid;
  }
}
