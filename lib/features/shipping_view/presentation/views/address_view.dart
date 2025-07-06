import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utilis/save_user_locally.dart';
import 'package:fruits_hub/core/widgets/cutom_text-field.dart';
import 'package:fruits_hub/features/cart_view/data/entities/cart_entity.dart';
import 'package:fruits_hub/features/home_view/presentation/views/product_detail_view.dart';
import 'package:fruits_hub/features/shipping_view/domain/entity/address_entity.dart';
import 'package:fruits_hub/features/shipping_view/domain/entity/order_entity.dart';
import 'package:fruits_hub/features/shipping_view/presentation/views/widgets/custom_switch_tile.dart';

import '../../../../core/utilis/shared_prefrences.dart';
import '../../../../core/utilis/styles.dart';
import '../../../../core/widgets/build_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/l10n.dart';
import '../../../cart_view/presentation/manager/cart_cubit.dart';
import '../manager/set_orderes_cubit/set_orders_cubit.dart';

class AddressView extends StatefulWidget {
  const AddressView({
    super.key,
    required this.onNext,
  });

  final VoidCallback onNext;
  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView>
    with AutomaticKeepAliveClientMixin {
  GlobalKey<FormState> key = GlobalKey();
  bool saveAddress = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  // المتغيرات التي تمثل الحقول
  String? name;
  String? email;
  String? phone;
  String? address;
  String? city;
  String? flatNumber;

  // Controllers لكل حقل
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController cityController;
  late TextEditingController flatNumberController;

  @override
  void initState() {
    super.initState();

    saveAddress = SharedPreferencesSingelton.getBool('saveAddress') ?? false;

    AddressEntity addressEntity = getAddressLocally();

    // تهيئة جميع الحقول دفعة واحدة
    initializeControllers(addressEntity);
  }

  @override
  void dispose() {
    // تنظيف الـ controllers
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    cityController.dispose();
    flatNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SetOrdersCubit, SetOrdersState>(
        listener: (context, state) {
          if (state is SetOrderAddressSuccess) {
            addressController.text =
                BlocProvider.of<SetOrdersCubit>(context).orderEntity.address ??
                    '';
            setState(() {});
          }
        },
        builder: (context, state) {
          return Form(
            key: key,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      spacing: 20,
                      children: [
                        CustomTextField(
                          labelText: S.of(context).name,
                          controller: nameController,
                          style:
                              Styles.bold13.copyWith(color: Color(0xff949D9E)),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                        CustomTextField(
                          labelText: S.of(context).email,
                          controller: emailController,
                          style:
                              Styles.bold13.copyWith(color: Color(0xff949D9E)),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                        CustomTextField(
                          labelText: S.of(context).phonenumber,
                          controller: phoneController,
                          style:
                              Styles.bold13.copyWith(color: Color(0xff949D9E)),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                        CustomTextField(
                          labelText: S.of(context).address,
                          controller: addressController,
                          style:
                              Styles.bold13.copyWith(color: Color(0xff949D9E)),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                        CustomTextField(
                          labelText: S.of(context).city,
                          controller: cityController,
                          style:
                              Styles.bold13.copyWith(color: Color(0xff949D9E)),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                        CustomTextField(
                          labelText: S.of(context).flat,
                          controller: flatNumberController,
                          style:
                              Styles.bold13.copyWith(color: Color(0xff949D9E)),
                          textInputType: TextInputType.text,
                          maxLines: 2,
                        ),
                        CustomSwitchTile(
                          title: S.of(context).saveaddress,
                          value: saveAddress,
                          onChanged: (val) {
                            setState(() {
                              saveAddress = val;
                            });

                            SharedPreferencesSingelton.setBool(
                                'saveAddress', saveAddress);

                            if (saveAddress) {
                              // تأكد من تحديث المتغيرات من الـ controllers قبل الحفظ
                              name = nameController.text;
                              email = emailController.text;
                              phone = phoneController.text;
                              address = addressController.text;
                              city = cityController.text;
                              flatNumber = flatNumberController.text;

                              AddressEntity addressEntity = AddressEntity(
                                name: name ?? '',
                                email: email ?? '',
                                phone: phone ?? '',
                                address: address ?? '',
                                city: city ?? '',
                                flatNumber: flatNumber ?? '',
                              );
                              saveAddressLocally(addressEntity);
                            } else {
                              nameController.clear();
                              emailController.clear();
                              phoneController.clear();
                              addressController.clear();
                              cityController.clear();
                              flatNumberController.clear();
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomButton(
                            height: 55,
                            title: S.of(context).next,
                            backgroundColor: Styles.primaryColor,
                            borderRadius: 16,
                            titleStyle:
                                Styles.bold19.copyWith(color: Colors.white),
                            onPressed: () {
                              if (key.currentState!.validate()) {
                                key.currentState!.save();
                                BlocProvider.of<SetOrdersCubit>(context)
                                    .orderEntity = OrderEntity(
                                  userID: getUserDataLocally().id,
                                  payCash:
                                      BlocProvider.of<SetOrdersCubit>(context)
                                          .orderEntity
                                          .payCash,
                                  price: BlocProvider.of<CartCubit>(context)
                                      .cartEntity
                                      .calculateTotalPrice(),
                                  amount: BlocProvider.of<CartCubit>(context)
                                      .cartEntity
                                      .calculateNumOfProducts(),
                                  name: name,
                                  email: email,
                                  phone: phone,
                                  address: address,
                                  city: city,
                                  flatNumber: flatNumber,
                                  date: DateTime.now().toString(),
                                );
                                widget.onNext();
                              } else {
                                autovalidateMode = AutovalidateMode.always;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  void initializeControllers(AddressEntity address) {
    nameController = createController(address.name, (val) => name = val);
    emailController = createController(address.email, (val) => email = val);
    phoneController = createController(address.phone, (val) => phone = val);
    addressController =
        createController(address.address, (val) => this.address = val);
    cityController = createController(address.city, (val) => city = val);
    flatNumberController =
        createController(address.flatNumber, (val) => flatNumber = val);
  }

  TextEditingController createController(
      String text, Function(String) onChanged) {
    final controller = TextEditingController(text: text);
    onChanged(text); // تعيين القيمة الأولية
    controller
        .addListener(() => onChanged(controller.text)); // التحديث عند التغيير
    return controller;
  }
}
