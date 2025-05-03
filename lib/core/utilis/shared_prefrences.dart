import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesSingelton{
  static late SharedPreferences instance;
  static Future<void> init() async {
    instance=await SharedPreferences.getInstance();
  }
  static setBool(String key,bool value){
    instance.setBool(key, value);
  }
  static getBool(String key){
    return instance.getBool(key)??false;
  }
  static setString(String key,String value){
    instance.setString(key, value);
  }
  static getString(String key){
    return instance.getString(key)??false;
  }
}