import 'package:dartz/dartz.dart';

import '../../../../core/errors/server_failure.dart';
import '../entities/product_entity.dart';

abstract class ProductRepo{
  Future<Either<Failure,List<ProductEntity>>> getProducts();
  Future<Either<Failure,List<ProductEntity>>> getBestSellingProducts();
  Future<Either<Failure,List<ProductEntity>>> getOurProducts();
  Future<Either<Failure,List<ProductEntity>>> getSearchProducts({required String searchWord});
  Future<Either<Failure, List<ProductEntity>>> getFilteredProducts({required num startRange,required num endRange});
}