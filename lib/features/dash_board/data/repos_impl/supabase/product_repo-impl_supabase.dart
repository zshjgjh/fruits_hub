import 'package:dartz/dartz.dart';


import '../../../../../core/errors/server_failure.dart';
import '../../../../../core/utilis/constants.dart';
import '../../../../../core/utilis/services/supabase/subabase_data_base_service.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/repos/product_repo.dart';
import '../../models/product_model.dart';

class ProductRepoImplSupabase implements ProductRepo{
  final SupaBaseDataBase supabaseDataBase;

  ProductRepoImplSupabase({required this.supabaseDataBase});
  @override
  Future<Either<Failure, void>> addProduct(ProductEntity productEntity) async {
  try {
    var result= await supabaseDataBase.addData(path: kProductStorage, data:ProductModel.fromEntity(productEntity).toJason());
    return right(null);
  }  catch (e) {
    return left(ServerFailure(e.toString()));
  }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data =await supabaseDataBase.getData(
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

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data= await supabaseDataBase.getData(path: kProductStorage)  as List<Map<String,dynamic>> ;
      List<ProductModel> products= data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> productEntities=products.map((e) => e.toEntity()).toList();
      print('${productEntities[0].name}');
      return right(productEntities);

    }  catch (e) {
      print('${e.toString()} failure in product repo');
      return left(ServerFailure(e.toString()));
    }
  }

}