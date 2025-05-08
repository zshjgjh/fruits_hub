
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../constants.dart';
import '../data_base_service.dart';
import '../fire_base/fire_store_service.dart';

class SupaBaseDataBaseService implements DataBaseService {
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
    if (id != null) {
        var data = await supabase.client.from(path).select().eq('id', id);
        return data;
      } else {
        var data = await supabase.client.from(path).select();
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var descending = query['descending'];
          data = await supabase.client.from(path).select().order(orderByField,ascending: !descending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data =await  supabase.client.from(path).select().limit(limit);
        }
      }
        var result =  data;
      print('${result.length},zzzz');
        return result;// return is list of products
      }

    }

  @override
  Future<bool> isDataExists({required String path, required String id}) {
    // TODO: implement isDataExists
    throw UnimplementedError();
  }
}