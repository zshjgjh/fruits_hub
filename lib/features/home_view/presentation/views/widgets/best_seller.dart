import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utilis/app_routers.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/products_bloc_builder.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';
import '../../manager/get_products_cubit.dart';

class BestSellerView extends StatefulWidget {
  const BestSellerView({
    super.key,
  });

  @override
  State<BestSellerView> createState() => _BestSellerViewState();
}

class _BestSellerViewState extends State<BestSellerView> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetProductsCubit>(context).getBestSellingProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0,right: 8,left: 8),
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Column(
                spacing: 30,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildAppBar(context, title: 'Best seller', leading:Image.asset(Assets.imagesNotification)),
                  Text(
                    'Best Seller',
                    style: Styles.bold19,
                  ),
                  SizedBox(height: 1,)
                ],
              ),
            ),
            productsBlocBuilder()
          ]),
        ),

    );
  }
}
