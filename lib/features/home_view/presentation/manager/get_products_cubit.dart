import 'package:bloc/bloc.dart';
import 'package:fruits_hub/core/errors/server_failure.dart';
import 'package:fruits_hub/features/home_view/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

import '../../domain/repos/product_repo.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit({required this.productRepo}) : super(GetProductsInitial());
  final ProductRepo  productRepo;
  Future<void> getProducts()async {
    emit(GetProductsLoading());
   var result= await productRepo.getProducts();
   result.fold(
       (failure){
        emit(GetProductsFailure(errorMessage: failure.errorMessage));
       }, (products){
         emit(GetProductsSuccess(products:products ));
   }
   );
  }

  Future<void> getBestSellingProducts()async {
    emit(GetProductsLoading());
    var result= await productRepo.getBestSellingProducts();
    result.fold(
            (failure){
          emit(GetProductsFailure(errorMessage: failure.errorMessage));
        }, (products){
      emit(GetProductsSuccess(products:products ));
    }
    );
  }
}
