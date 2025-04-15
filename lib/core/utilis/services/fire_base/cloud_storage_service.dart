import 'dart:io';


import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as b;

abstract class Storage {
  Future<String> uploadFile(File file,String path);
}

class CloudStorageService implements Storage{
  @override
  Future<String> uploadFile(File file,String path) async { // path represents bucket or folder name in cloud like images
    final storageRef = FirebaseStorage.instance.ref();// create object from storage service with reference
   String  fileName=b.basename(file.path);// get file name
   String fileExtension=b.extension(file.path);//get file extension
   var fileRef=storageRef.child('$path/$fileName.$fileExtension');//create ref to put file with full path
    await fileRef.putFile(file);// put file in file reference
    var fileUrl=fileRef.getDownloadURL();// get url to download file
    return fileUrl;

  }

}