import 'package:dartz/dartz.dart';

import '../../../../core/errors/server_failure.dart';
import '../../../../core/utilis/constants.dart';
import '../../../../core/utilis/services/supabase/subabase_data_base_service.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repos/product_repo.dart';
import '../models/product_model.dart';



class ProductRepoImpl implements ProductRepo{
  final SupaBaseDataBaseService supabaseDataBaseService;

  ProductRepoImpl({required this.supabaseDataBaseService});

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data =await supabaseDataBaseService.getData(
          path: kProductStorage,
          query: {
            'orderBy':'sellingCount',
            'descending':true,
            'limit':10
          }) as List<Map<String, dynamic>> ;

      List<ProductModel> products= data.map((e) => ProductModel.fromJson(e)).toList();

      List<ProductEntity> productEntities=products.map((e) => e.toEntity()).toList();
      return right(productEntities);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data= await supabaseDataBaseService.getData(path: kProductStorage) as List<Map<String, dynamic>> ;
      List<ProductModel> products= data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> productEntities=products.map((e) => e.toEntity()).toList();
      return right(productEntities);

    }  catch (e) {
      print('${e.toString()} failure in product repo');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getOurProducts() async {
    try {
      var data =await supabaseDataBaseService.getData(
          path: kProductStorage,
          query: {
            'isFeatured':true,
          }) as List<Map<String, dynamic>> ;

      List<ProductModel> products= data.map((e) => ProductModel.fromJson(e)).toList();

      List<ProductEntity> productEntities=products.map((e) => e.toEntity()).toList();
      return right(productEntities);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getSearchProducts({required String searchWord}) async {
    try {
      var data =await supabaseDataBaseService.getData(
          path: kProductStorage,
          query: {
            'searchWord':searchWord,
          }) as List<Map<String, dynamic>> ;

      List<ProductModel> products= data.map((e) => ProductModel.fromJson(e)).toList();

      List<ProductEntity> productEntities=products.map((e) => e.toEntity()).toList();
      return right(productEntities);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }

  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getFilteredProducts({required num startRange,required num endRange}) async {
    try {
      var data =await supabaseDataBaseService.getData(
          path: kProductStorage,
          query: {
            'startRange':startRange,
            'endRange':endRange
          }) as List<Map<String, dynamic>> ;

      List<ProductModel> products= data.map((e) => ProductModel.fromJson(e)).toList();

      List<ProductEntity> productEntities=products.map((e) => e.toEntity()).toList();
      return right(productEntities);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

}