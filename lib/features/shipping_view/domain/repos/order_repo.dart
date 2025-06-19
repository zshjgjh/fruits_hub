import 'package:dartz/dartz.dart';

import '../../../../core/errors/server_failure.dart';
import '../../../login_view/domain/entities/user_entity.dart';
import '../entity/order_entity.dart';

abstract class OrderRepo{
  Future<Either<Failure,void>> setOrder({required OrderEntity orderEntity });
  Future<Either<Failure,List<OrderEntity>>> getOrdersByUser({required UserEntity userEntity});


}