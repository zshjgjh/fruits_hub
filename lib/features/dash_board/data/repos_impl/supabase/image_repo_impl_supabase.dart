import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/server_failure.dart';
import '../../../../../core/utilis/constants.dart';
import '../../../../../core/utilis/services/supabase/supabase_storage_service.dart';
import '../../../domain/repos/image_repo.dart';

class ImageRepoImplSupabase implements ImageRepo{
  final SupaBaseStorageService supaBaseStorageService;

  ImageRepoImplSupabase({required this.supaBaseStorageService});

  @override
  Future<Either<Failure, String>> addImage(File image) async {
    try {
      String url=   await supaBaseStorageService.uploadFile(image, kImagesStorage);
      return Right(url);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

}