import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/shipping_view/domain/entity/order_entity.dart';
import 'package:meta/meta.dart';

import '../../../../login_view/domain/entities/user_entity.dart';
import '../../../domain/repos/order_repo.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit({required this.orderRepo}) : super(GetOrdersInitial());

  final OrderRepo orderRepo;


  Future<void> getOrdersByUser({required UserEntity userEntity}) async {
    emit(GetOrdersLoading());
    var result=await orderRepo.getOrdersByUser(userEntity: userEntity);
    result.fold((failure){
      emit(GetOrdersFailure(errorMessage: failure.toString()));

    }, (orders){
      emit(GetOrdersSuccess(orders: orders));

    });
  }
}
