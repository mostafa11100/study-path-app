import 'package:shared_preferences/shared_preferences.dart';

class AddToSharedPref {
  static SharedPreferences? pref;
  static addstring({
    String? key,
    String? value,
  }) async {
    pref = await SharedPreferences.getInstance();
    pref!.setString(key!, value!);
  }

  static addint({
    String? key,
    int? value,
  }) async {
    pref = await SharedPreferences.getInstance();
    pref!.setInt(key!, value!);
  }

  static addbool({
    String? key,
    bool? value,
  }) async {
    pref = await SharedPreferences.getInstance();
    pref!.setBool(key!, value!);
  }

  static addlist({
    String? key,
    List<String>? value,
  }) async {
    pref = await SharedPreferences.getInstance();
    pref!.setStringList(key!, value!);
  }
}
