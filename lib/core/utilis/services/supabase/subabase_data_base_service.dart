
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../constants.dart';
import '../fire_base/fire_storage_service.dart';

class SupaBaseDataBase implements DataBase {
  static late Supabase supabase;
  static initSupabase() async {
    supabase = await Supabase.initialize(
      url: kSupabaseUrl,
      anonKey: kSupabaseKey, //we used secret key in API setting to be able to store files
    );
  }// call in main
  @override
  Future<void> addData({required String path, required Map<String, dynamic> data, String? id}) async {
    await supabase.client
        .from(path)
        .insert(data); // path same as bucket name
  }

  @override
  Future<dynamic> getData({required String path, Map<String, dynamic>? query, String? id}) async {
    var data = await supabase.client
        .from(path)
        .select() ;

    return data;
  }
}