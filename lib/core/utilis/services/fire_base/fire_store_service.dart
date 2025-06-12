import 'package:cloud_firestore/cloud_firestore.dart';

import '../data_base_service.dart';

class FireStoreService implements DataBaseService {

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  Future<void> addData({required String path, required Map<String, dynamic> data, String? id,}) async {
   if(id !=null){
     await fireStore.collection(path).doc(id).set(data);
   }else{
     await fireStore.collection(path).add(data);
   }

  }

  @override
  Future<dynamic> getData({required String path,Map<String, dynamic>? query, String? id,}) async {
    if (id != null) {
      var data = await fireStore.collection(path).doc(id).get();
      return data.data() as Map<String,dynamic> ;// return is one product that is why return is dynamic
    } else {
      Query<Map<String, dynamic>> data = fireStore.collection(path);
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
      return result.docs.map((e) => e.data()).toList();// return is list of products
    }
  }

  @override
  Future<bool> isDataExists({required String path, required String id}) async {
   var data =await fireStore.collection(path).doc(id).get();
   return data.exists;
  }

  @override
  Future<void> deleteData({required String path, required String id}) async {
   await fireStore.collection(path).doc(id).delete();
  }
}
