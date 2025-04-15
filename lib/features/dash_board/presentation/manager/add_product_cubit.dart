import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../data/repos_impl/supabase/image_repo_impl_supabase.dart';
import '../../data/repos_impl/supabase/product_repo-impl_supabase.dart';
import '../../domain/entities/product_entity.dart';



part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.productRepo, this.imageRepo) : super(AddProductInitial());
  final ProductRepoImplSupabase productRepo;
  final ImageRepoImplSupabase imageRepo;
  Future<void> addProduct(ProductEntity productEntity)async {
    emit(AddProductLoading());
    var result= await imageRepo.addImage(productEntity.imageFile!);
    result.fold(
        (failure){
          print('fff');
          emit(AddProductFailure(errMessage:failure.toString() ));
        },(url)async{
          url=productEntity.imageUrl!;
          var result=await productRepo.addProduct(productEntity);
          result.fold(
                  (failure){
            emit(AddProductFailure(errMessage:failure.toString()));
          },(r){
            emit(AddProductSuccess());
      });
    }
    );
  }
  void onChange(Change<AddProductState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
