import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DataBase {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? id,
  });
  Future<dynamic> getData({
    required String path,
    Map<String, dynamic>? query,
    String? id,
  });
}

class FireStorageService implements DataBase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? id,
  }) async {
    await firestore.collection(path).doc(id).set(data);
  }

  @override
  Future<dynamic> getData({required String path, Map<String, dynamic>? query, String? id,}) async {
    if (id != null) {
      var data = await firestore.collection(path).doc(id).get();
      return data.data() ;
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderByField, descending: descending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }
}
