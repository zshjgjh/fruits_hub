import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/features/home_view/data/models/search_item_model.dart';
import 'package:fruits_hub/features/home_view/presentation/manager/search_cubit/search_cubit.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/products_bloc_builder.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/search_field.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/search_item.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../manager/products_cubit/products_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({
    super.key,
  });

  @override
  State<SearchView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<SearchView> {
  bool isSearch = false;
  bool isTyping = false;
  String? searchWord;
  Timer? debounce;
  SearchItemModel? searchItemModel;
  List<SearchItemModel> searchItems = [];

  @override
  void initState() {
    isSearch = true;
    BlocProvider.of<SearchCubit>(context).getSearchHistory(context);
    super.initState();
  }

  void onSearchChanged({required String searchWord}) {
    // Cancel previous timer
    if (debounce?.isActive ?? false) debounce!.cancel();

    // Start new timer
    debounce = Timer(const Duration(milliseconds: 500), () {
      BlocProvider.of<ProductsCubit>(context)
          .getSearchProducts(searchWord: searchWord);
    });
  }

  @override
  void dispose() {
    debounce?.cancel();
    super.dispose();
  }

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
                    title: S.of(context).search,
                    action: Image.asset(Assets.imagesNotification),
                    onPressed: () {
                  PersistentNavBarNavigator.pop(context);
                }, isArrowExists: true),
                SearchField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus(); //remove keyboard
                    isSearch = true;
                    isTyping = false;
                    setState(() {});
                  },
                  onChanged: (value) {
                    isTyping = true;
                    isSearch = false;
                    BlocProvider.of<SearchCubit>(context)
                        .getSearchHistory(context);
                    onSearchChanged(searchWord: value);
                    setState(() {});
                  },
                  onSubmitted: (value) {
                    isTyping = false;
                    isSearch = false;
                    searchItemModel = SearchItemModel(title: value);
                    BlocProvider.of<SearchCubit>(context)
                        .addSearchItem(searchItemModel: searchItemModel!);
                    setState(() {});
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
                        S.of(context).recentsearch,
                        style: Styles.bold19,
                      ),
                      Spacer(),
                      Text(
                        S.of(context).deleteall,
                        style: Styles.regular13
                            .copyWith(color: Colors.grey.withOpacity(.2)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 200,
                    child: BlocListener<SearchCubit, SearchState>(
                      listener: (context, state) {
                        if (state is SearchSuccess) {
                          searchItems = state.searchItems;
                        } else if (state is SearchFailure) {
                          print(state.errorMessage);
                        }
                      },
                      child: BlocBuilder<SearchCubit, SearchState>(
                        builder: (context, state) {
                          if (state is SearchSuccess) {
                            return ListView.builder(
                              itemCount: searchItems.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return searchItems.isNotEmpty
                                    ? SearchItem(
                                        searchItemModel: searchItems[index],
                                        onPressed: () {
                                          BlocProvider.of<SearchCubit>(context)
                                              .deleteSearchHistory(context,
                                                  searchItemModel:
                                                      searchItems[index]);
                                          BlocProvider.of<SearchCubit>(context)
                                              .getSearchHistory(context);
                                        },
                                      )
                                    : SizedBox();
                              },
                            );
                          } else if (state is SearchFailure) {
                            return Text('fail to load history');
                          } else {
                            return Text('');
                          }
                        },
                      ),
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
                      child: Text(S.of(context).nosearchresult),
                    ),
                    Image.asset(Assets.imagesSearchimg),
                  ]),
            ),
          ),
          isSearch == false && isTyping == false
              ? productsBlocBuilder()
              : SliverToBoxAdapter(child: SizedBox()),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 20,
          )),
        ]),
      ),
    );
  }
}
