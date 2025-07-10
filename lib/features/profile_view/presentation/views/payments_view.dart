import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';

import 'package:fruits_hub/features/profile_view/presentation/views/add_new_card_view.dart';
import 'package:fruits_hub/features/profile_view/presentation/views/widgets/custom_card_field.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/utilis/styles.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../manager/card_cubit/card_cubit.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CardCubit>(context).getCards();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CardCubit, CardState>(
      listener: (context, state) {
        if (state is CardLoading) {
          setState(() => isLoading = true);
        } else if (state is CardFailure) {
          isLoading=false;
          setState(() {

          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).nocards)),
          );
        }else {
          setState(() => isLoading = false);
        }


      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<CardCubit, CardState>(
              builder: (context, state) {
                final cards = state is CardSuccess ? state.cards : [];

                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          buildAppBar(
                            context,
                            title: S.of(context).payment,
                            isArrowExists: true,
                            action: Image.asset(Assets.imagesEdit),
                            onPressed: () {
                              PersistentNavBarNavigator.pop(context);
                            },
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            final card = cards[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      card.delete();
                                      BlocProvider.of<CardCubit>(context).getCards();
                                    },
                                    icon: const Icon(Icons.close),
                                  ),
                                  CustomCardField(
                                    suffix: getCardBrandImage(card.cardNumber),
                                    controller: TextEditingController(
                                      text: maskCardNumber(card.cardNumber),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          childCount: cards.length,
                        ),
                      ),

                    const SliverToBoxAdapter(child: SizedBox(height: 24)),

                    SliverToBoxAdapter(
                      child: CustomButton(
                        title: S.of(context).addnewpayment,
                        height: 55,
                        backgroundColor: Styles.primaryColor,
                        borderRadius: 16,
                        titleStyle: Styles.bold19.copyWith(color: Colors.white),
                        onPressed: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const AddNewCardView(),
                            withNavBar: true,
                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          );
                        },
                      ),
                    ),

                    const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  String maskCardNumber(String cardNumber) {
    if (cardNumber.length >= 4) {
      String last4 = cardNumber.substring(cardNumber.length - 4);
      return '**** $last4';
    } else {
      return '****';
    }
  }

  String getCardBrandImage(String cardNumber) {
    if (cardNumber.startsWith('4')) {
      return Assets.imagesVisa;
    } else if (cardNumber.startsWith('5')) {
      return Assets.imagesMasterCard;
    }
    return Assets.imagesVisa;
  }
}
