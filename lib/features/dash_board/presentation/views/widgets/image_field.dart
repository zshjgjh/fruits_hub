import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileChanged});
  final ValueChanged<File?> onFileChanged;
  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  File? imageFile;
  bool isLoad=false;
  @override

  Widget build(BuildContext context) {

    return Stack(
      children:[
        GestureDetector(
          onTap: () async {
            isLoad=true;
            setState(() {

            });
            imageFile=await pickImage();
            isLoad=false;
            setState(() {

            });
    },
          child: Container(
            clipBehavior: Clip.hardEdge,
          width: double.infinity,
          decoration:BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(12)
          ),
            child: imageFile != null?Image.network(imageFile!.path) : Skeletonizer(
              enabled: isLoad,
              child: Icon(
                Icons.image_outlined,
                size: 150,
              ),
            )
                ),
        ),
        Visibility(
            child: imageFile!=null?IconButton(onPressed: (){
              imageFile=null;
              setState(() {

              });
            },
                icon: Icon(Icons.delete,color: Colors.red,),):SizedBox()
        )
    ]
    );
  }

  Future<File?> pickImage() async {
     final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageFile = File(image.path); //convert image to file
       widget.onFileChanged(imageFile);
      return imageFile;
    }
    return null;
  }
}