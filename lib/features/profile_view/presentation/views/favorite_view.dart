import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/utilis/styles.dart';
import '../../../../generated/l10n.dart';
import '../../../home_view/domain/entities/product_entity.dart';
import '../../../home_view/presentation/views/widgets/product_item.dart';
import '../manager/favorite_cubit/favorite_cubit.dart';


class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {

  List<ProductEntity> favorites=[];
  @override
  void initState(){
    super.initState();
     favorites = context.read<FavoriteCubit>().getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {


          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomScrollView(
              slivers: [

             SliverToBoxAdapter(child:
                buildAppBar(context, title: S.of(context).favorite, isArrowExists: true,onPressed:(){
                  PersistentNavBarNavigator.pop(context);
                } )),
             favorites.isNotEmpty?
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        final product = favorites[index];
                        return ProductItem(productEntity: product);
                      },
                      childCount: favorites.length,
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.75,
                    ),
                  ):SliverToBoxAdapter(child: Center(child: Text(S.of(context).nofavorite,style: Styles.bold19,)))
                
              ],
            ),
          );
        },
      ),
    );
  }
}