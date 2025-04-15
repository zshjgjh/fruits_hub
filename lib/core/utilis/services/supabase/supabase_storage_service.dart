 import 'dart:io';
 import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../constants.dart';
import '../fire_base/cloud_storage_service.dart';

class SupaBaseStorageService implements Storage{
  static late Supabase supabase;

  static initSupabase() async {
    supabase = await Supabase.initialize(
      url: kSupabaseUrl,
      anonKey: kSupabaseKey, //we used secret key in API setting to be able to store files
    );
  }// call in main


  static createBucket(String bucketName) async {
    bool isBucketExist = false;
    var buckets = await supabase.client.storage.listBuckets();
    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isBucketExist = true;
        break;
      }
    }
    if (isBucketExist == false) {
      await supabase.client.storage
          .createBucket(bucketName); //create bucket or folder
    }

  }//call in main

  @override
  Future<String> uploadFile(File file, String bucketName) async {
    String  fileName=b.basename(file.path);// get file name
    String fileExtension=b.extension(file.path);//get file extension

     var uploadedFile = await supabase.client.storage.from(bucketName).
    upload('$bucketName/$fileName.$fileExtension',file);// store file in bucket

     var fileUrl= supabase.client
        .storage
        .from(bucketName)
        .getPublicUrl('$bucketName/$fileName.$fileExtension');// download file url

    return fileUrl;
  }
}