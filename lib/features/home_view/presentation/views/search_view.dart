import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/build_bottom_bar.dart';
import 'package:fruits_hub/features/home_view/presentation/views/best_seller_view.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/our_product_item.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/our_products-bloc_builder.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/product_item.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/products_bloc_builder.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/search_field.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/search_item.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';
import '../../domain/entities/product_entity.dart';
import '../manager/get_products_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({
    super.key,
  });

  @override
  State<SearchView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<SearchView> {
  @override
  void initState() {
    isSearch=true;
    super.initState();
  }

  bool isSearch = false;
  bool isTyping=false;
  String? searchWord;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildAppBar(context,
                    title: 'Search',
                    leading: Image.asset(Assets.imagesNotification)),
                SearchField(
                  onTapOutside: (event){
                    FocusScope.of(context).unfocus();
                    isSearch=true;
                    isTyping=false;
                    setState(() {

                    });
                  },
                  onChanged: (value){
                    isTyping=true;
                    isSearch=false;
                    setState(() {

                    });
                  },
                  onSubmitted: (value) {
                    isTyping=false;
                    isSearch=false;
                    setState(() {

                    });
                    searchWord=value;
                    BlocProvider.of<GetProductsCubit>(context)
                        .getSearchProducts(searchWord: searchWord!);
                  },
                ),
                SizedBox(
                  height: 1,
                )
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: Visibility(
              visible: isTyping,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Recent research',
                        style: Styles.bold19,
                      ),
                      Spacer(),
                      Text(
                        'Delete all',
                        style: Styles.regular13
                            .copyWith(color: Colors.grey.withOpacity(.2)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return SearchItem();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Visibility(
              visible: isSearch,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.white,
                      child: Text('No Search Reults'),
                    ),
                    Image.asset(Assets.imagesSearchimg),
                  ]),
            ),
          ),

          isSearch==false && isTyping==false? productsBlocBuilder():SliverToBoxAdapter(child: SizedBox()),

          SliverToBoxAdapter(
              child: SizedBox(
            height: 20,
          )),
        ]),
      ),
    );
  }
}
