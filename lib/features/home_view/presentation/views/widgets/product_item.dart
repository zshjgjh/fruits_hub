import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/build_bottom_bar.dart';
import 'package:fruits_hub/features/cart_view/presentation/manager/cart_cubit.dart';
import 'package:fruits_hub/features/home_view/domain/entities/product_entity.dart';
import 'package:fruits_hub/features/profile_view/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utilis/app_routers.dart';
import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../cart_view/presentation/views/cart_view.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.withOpacity(.1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                final isFavorite = BlocProvider.of<FavoriteCubit>(context).favoriteEntity.isProductFavorite(productEntity);

                return IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    BlocProvider.of<FavoriteCubit>(context)
                        .addFavorite(productEntity:productEntity);
                  },
                );
              },
            ),
            SizedBox(
              height: 100,
              width: 120,
              child: Image.network(
                productEntity.imageUrl ?? '',
                fit: BoxFit.cover,
              ),
            ),
            Text(productEntity.name, style: Styles.bold19),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${productEntity.price}',
                  style: Styles.bold19.copyWith(color: Color(0xFFF4A91F)),
                ),
                Text(
                  r' $ / pound',
                  style: Styles.bold16.copyWith(color: Color(0xFFF8C76D)),
                ),
                Spacer(),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Color(0xFF1B5E37),
                  ),
                  child: IconButton(
                    onPressed: () {
                      BlocProvider.of<CartCubit>(context)
                          .addItem(productEntity: productEntity);
                      Provider.of<TabControllerProvider>(context, listen: false)
                          .controller
                          .index = 2;
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


