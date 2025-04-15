import 'dart:io';

import 'package:dartz/dartz.dart';


import '../../../../../core/errors/server_failure.dart';
import '../../../../../core/utilis/constants.dart';
import '../../../../../core/utilis/services/fire_base/cloud_storage_service.dart';
import '../../../domain/repos/image_repo.dart';

class ImageRepoImpl implements ImageRepo{
  final CloudStorageService cloudStorageService;

  ImageRepoImpl({required this.cloudStorageService});


  @override
  Future<Either<Failure, String>> addImage(File image) async {
    try {
      String url=   await cloudStorageService.uploadFile(image, kImagesStorage);
      return Right(url);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

}