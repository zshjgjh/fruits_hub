import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/server_failure.dart';




abstract class ImageRepo{
  Future<Either<Failure,String>> addImage(File image);
}

