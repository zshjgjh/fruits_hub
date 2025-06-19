import 'package:dartz/dartz.dart';

import 'package:fruits_hub/core/errors/server_failure.dart';
import 'package:fruits_hub/core/utilis/constants.dart';
import 'package:fruits_hub/features/shipping_view/data/models/order_model.dart';

import 'package:fruits_hub/features/shipping_view/domain/entity/order_entity.dart';

import '../../../../core/utilis/services/supabase/subabase_data_base_service.dart';
import '../../../login_view/domain/entities/user_entity.dart';
import '../../domain/repos/order_repo.dart';

class OrderRepoImp implements OrderRepo{

  final SupaBaseDataBaseService supabaseDataBaseService;

  OrderRepoImp({required this.supabaseDataBaseService});

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrdersByUser({required UserEntity userEntity}) async {

    try {
      var data=await supabaseDataBaseService.getData(path: kOrders,query:{'userID':userEntity.id} ) as List<Map<String,dynamic>>;
      List<OrderModel> orders=data.map((e) => OrderModel.fromJson(e)).toList() ;
      List<OrderEntity> ordersEntities=orders.map((e) => e.toEntity()).toList();
      return right(ordersEntities);

    } catch (e) {

      return left(ServerFailure(e.toString()));
    }

  }

  @override
  Future<Either<Failure, void>> setOrder({required OrderEntity orderEntity}) async {
    try {
      await supabaseDataBaseService.addData(path: kOrders, data: OrderModel.fromEntity(orderEntity).toJson());

      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }


}