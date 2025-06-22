import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utilis/save_user_locally.dart';
import 'package:fruits_hub/features/shipping_view/domain/entity/order_entity.dart';

import 'package:fruits_hub/features/shipping_view/presentation/views/success_payment_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../../core/utilis/styles.dart';
import 'widgets/edit_field_bottom_sheet.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/assets.dart';
import '../manager/get_orders_cubit/get_orders_cubit.dart';
import '../manager/set_orderes_cubit/set_orders_cubit.dart';

class ReviewView extends StatefulWidget {
  const ReviewView({
    super.key, this.onEditPayment,
  });
  final VoidCallback? onEditPayment;


  @override
  State<ReviewView> createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {

  bool get payCash =>
      BlocProvider.of<SetOrdersCubit>(context).orderEntity.payCash ?? true;

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<SetOrdersCubit, SetOrdersState>(
      listener: (context, state) {
        if (state is SetOrdersSuccess) {

          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: SuccessPaymentView(),
            withNavBar: true, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation:
            PageTransitionAnimation.cupertino,

          );

        } else if (state is SetOrdersFailure) {
          ScaffoldMessenger.of(context).
          showSnackBar(SnackBar(content: Text('Fail to complete order...please try again later',style: Styles.bold19,),backgroundColor: Colors.red,));
        } else {
          if(state is SetOrderAddressSuccess){
            setState(() {

            });
          }
        }
      },
      builder: (context, state) {
        return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Summary:',
                        style: Styles.bold19,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.grey.shade300),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            spacing: 10,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Sub total:',
                                    style: Styles.regular13
                                        .copyWith(color: Colors.grey.shade600),
                                  ),
                                  Spacer(),
                                  Text(
                                    '${BlocProvider.of<SetOrdersCubit>(context).orderEntity.price ?? 0}',
                                    style: Styles.semiBold16,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Delivery:',
                                    style: Styles.regular13
                                        .copyWith(color: Colors.grey.shade600),
                                  ),
                                  Spacer(),
                                  Text(
                                    '${BlocProvider.of<SetOrdersCubit>(context).orderEntity.delivery ?? 0}',
                                    style: Styles.semiBold13
                                        .copyWith(color: Colors.grey.shade600),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Divider(
                                  thickness: 2,
                                  color: Color(0xffCACECE),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Total:',
                                    style: Styles.regular13,
                                  ),
                                  Spacer(),
                                  Text(
                                      '${(BlocProvider.of<SetOrdersCubit>(context).orderEntity.price ?? 0) + (BlocProvider.of<SetOrdersCubit>(context).orderEntity.delivery ?? 0)}',
                                      style: Styles.semiBold13),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Confirm your order',
                        style: Styles.bold19,
                      ),
                 payCash?  SizedBox() :Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.grey.shade300),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            spacing: 10,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Payment Method', style: Styles.bold13),
                                  Spacer(),
                                  Text(
                                    'edit',
                                    style: Styles.semiBold16,
                                  ),
                                  IconButton(
                                     icon: Icon(Icons.edit),
                                      onPressed: () {
                                        widget.onEditPayment?.call();

                                      } )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(Assets.imagesVisa),
                                  Text(
                                    '*** *** *** 6522',
                                    style: Styles.regular13
                                        .copyWith(color: Colors.grey.shade600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.grey.shade300),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            spacing: 10,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Address', style: Styles.regular13),
                                  Spacer(),
                                  Text(
                                    'edit',
                                    style: Styles.semiBold16,
                                  ),
                                  IconButton(
                                      onPressed: ()  {
                                        editFieldBottomSheet(context);
                                      }, icon: Icon(Icons.edit))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.location_on_outlined),
                                  Text(
                                    BlocProvider.of<SetOrdersCubit>(context)
                                            .orderEntity
                                            .address ?? '',
                                    style: Styles.regular13
                                        .copyWith(color: Colors.grey.shade600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomButton(
                        height: 55,
                        title: 'Confirm Order',
                        backgroundColor: Styles.primaryColor,
                        borderRadius: 16,
                        titleStyle: Styles.bold19.copyWith(color: Colors.white),
                        onPressed: () {
                          OrderEntity orderEntity =
                              BlocProvider.of<SetOrdersCubit>(context).orderEntity;

                          BlocProvider.of<SetOrdersCubit>(context)
                              .setOrder(orderEntity: orderEntity);


                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
      },
    );
  }

}
