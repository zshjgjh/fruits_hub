import 'package:bloc/bloc.dart';
import 'package:fruits_hub/core/errors/server_failure.dart';
import 'package:fruits_hub/features/home_view/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

import '../../../domain/repos/product_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.productRepo}) : super(ProductsInitial());
  final ProductRepo  productRepo;


  Future<void> getProducts()async {
    emit(ProductsLoading());
   var result= await productRepo.getProducts();
   result.fold(
       (failure){
        emit(ProductsFailure(errorMessage: failure.errorMessage));
       }, (products){
         emit(ProductsSuccess(products:products,));
   }
   );
  }

  Future<void> getBestSellingProducts()async {
    emit(ProductsLoading());
    var result= await productRepo.getBestSellingProducts();
    result.fold(
            (failure){
          emit(ProductsFailure(errorMessage: failure.errorMessage));
        }, (products){
      emit(ProductsSuccess(products:products ));
    }
    );
  }

  Future<void> getOurProducts()async {
    emit(ProductsLoading());
    var result= await productRepo.getOurProducts();
    result.fold(
            (failure){
          emit(ProductsFailure(errorMessage: failure.errorMessage));
        }, (products){
      emit(ProductsSuccess(products:products ));
    }
    );
  }

  Future<void> getSearchProducts({required String searchWord})async {
    emit(ProductsLoading());
    var result= await productRepo.getSearchProducts(searchWord: searchWord);
    result.fold(
            (failure){
          emit(ProductsFailure(errorMessage: failure.errorMessage));
        }, (products){
      emit(ProductsSuccess(products:products ));
    }
    );
  }

  Future<void> getFilteredProducts({required num startRange,required num endRange })async {
    emit(ProductsLoading());
    var result= await productRepo.getFilteredProducts(startRange: startRange, endRange: endRange);
    result.fold(
            (failure){
          emit(ProductsFailure(errorMessage: failure.errorMessage));
        }, (products){
      emit(ProductsSuccess(products:products ));
    }
    );
  }

}
