import 'package:dartz/dartz.dart';


import '../../../../core/errors/server_failure.dart';
import '../entities/product_entity.dart';

abstract class ProductRepo{
  Future<Either<Failure,void>> addProduct(ProductEntity productEntity);
  Future<Either<Failure,List<ProductEntity>>> getProducts();
  Future<Either<Failure,List<ProductEntity>>> getBestSellingProducts();
}