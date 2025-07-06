import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/shipping_view/domain/entity/order_entity.dart';
import 'package:fruits_hub/features/shipping_view/domain/repos/order_repo.dart';
import 'package:meta/meta.dart';

import '../../../../login_view/domain/entities/user_entity.dart';

part 'set_orders_state.dart';

class SetOrdersCubit extends Cubit<SetOrdersState> {
  SetOrdersCubit({required this.orderRepo}) : super(SetOrdersInitial());

  final OrderRepo orderRepo;
  OrderEntity orderEntity=OrderEntity();


   Future<void> setOrder({required OrderEntity orderEntity }) async {
     emit(SetOrdersLoading());
    var result=await orderRepo.setOrder(orderEntity: orderEntity);
    result.fold((failure){
      emit(SetOrdersFailure(errorMessage: failure.toString()));
      print(failure.toString());
      print(orderEntity.date);
    }, (r){
      emit(SetOrdersSuccess());

    });
  }
  void setOrderAddress({required String address}){

     try {
       orderEntity.address=address;
       emit(SetOrderAddressSuccess());
     } catch (e) {
    emit(SetOrdersFailure(errorMessage: e.toString()));
     }

}
  }


