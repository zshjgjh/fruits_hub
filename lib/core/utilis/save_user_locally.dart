import 'dart:convert';

import 'package:fruits_hub/core/utilis/shared_prefrences.dart';

import '../../features/login_view/data/models/user_model.dart';
import '../../features/login_view/domain/entities/user_entity.dart';
import '../../features/shipping_view/data/models/order_model.dart';
import '../../features/shipping_view/domain/entity/order_entity.dart';
import 'constants.dart';

addUserDataLocally(UserEntity userEntity) {
  var jsonString=jsonEncode(UserModel.fromEntity(userEntity).toJson());
  SharedPreferencesSingelton.setString(kSaveUserLocally, jsonString);
}

UserEntity getUserDataLocally() {
  var jsonString=SharedPreferencesSingelton.getString(kSaveUserLocally);
  UserEntity userEntity=(UserModel.fromJson(jsonDecode(jsonString))).toEntity();
  return userEntity;

}

saveAddressLocally(OrderEntity orderEntity) {
  var jsonString=jsonEncode(OrderModel.fromEntity(orderEntity).toJson());
  SharedPreferencesSingelton.setString(kSaveAddressLocally, jsonString);
}

OrderEntity getAddressLocally() {
  var jsonString=SharedPreferencesSingelton.getString(kSaveUserLocally);
  OrderEntity orderEntity=(OrderModel.fromJson(jsonDecode(jsonString))).toEntity();
  return orderEntity;

}


