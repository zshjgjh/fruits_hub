import 'package:dartz/dartz.dart';



import '../../../../../core/errors/server_failure.dart';
import '../../../../../core/utilis/constants.dart';
import '../../../../../core/utilis/services/fire_base/fire_storage_service.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/repos/product_repo.dart';
import '../../models/product_model.dart';

class ProductRepoImpl implements ProductRepo{
 final  FireStorageService fireStorageService;

  ProductRepoImpl({required this.fireStorageService});

  @override
  Future<Either<Failure, void>> addProduct(ProductEntity productEntity) async {
  try {
    var result=await fireStorageService.addData(path: kProductStorage, data:ProductModel.fromEntity(productEntity).toJason());// entity to model to json
    return right(null);
  }  catch (e) {
    return left(ServerFailure(e.toString()));
  }

  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =await fireStorageService.getData(path: kProductStorage) as List<Map<String,dynamic>>;
      List<ProductModel> products= data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> productEntities=products.map((e) => e.toEntity()).toList();
      return right(productEntities);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }

  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data =await fireStorageService.getData(
          path: kProductStorage,
          query: {
          'orderBy':'sellingCount',
          'descending':true,
          'limit':10
      }) ;

      List<ProductModel> products= data.map((e) => ProductModel.fromJson(e)).toList();

      List<ProductEntity> productEntities=products.map((e) => e.toEntity()).toList();
      return right(productEntities);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }

  }

}