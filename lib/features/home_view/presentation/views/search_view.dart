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
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  Timer? debounce;
  String? searchWord;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchCubit>(context).getSearchHistory(context);
  }

  void onSearchChanged(String searchWord) {
    if (debounce?.isActive ?? false) debounce!.cancel();
    debounce = Timer(const Duration(milliseconds: 500), () {
      BlocProvider.of<ProductsCubit>(context).getSearchProducts(searchWord: searchWord,context);
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
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildAppBar(
                    context,
                    title: S.of(context).search,
                    action: Image.asset(Assets.imagesNotification),
                    onPressed: () => PersistentNavBarNavigator.pop(context),
                    isArrowExists: true,
                  ),
                  SearchField(
                    onTapOutside: (_) => FocusScope.of(context).unfocus(),
                    onChanged: (value) {
                      searchWord = value;
                      BlocProvider.of<SearchCubit>(context).getSearchHistory(context);
                      onSearchChanged(value);
                    },
                    onSubmitted: (value) {
                      final model = SearchItemModel(title: value);
                      BlocProvider.of<SearchCubit>(context).addSearchItem(searchItemModel: model);
                    },
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      if (state is SearchLoading) {
                        return const CircularProgressIndicator();
                      } else if (state is SearchSuccess && state.searchItems.isNotEmpty) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(S.of(context).recentsearch, style: Styles.bold19),
                                const Spacer(),
                                Text(S.of(context).deleteall, style: Styles.bold13),
                                IconButton(onPressed:(){
                                  BlocProvider.of<SearchCubit>(context).deleteAllSearchItems(context);

                                }, icon: Icon(Icons.delete,color: Colors.red,))
                              ],
                            ),
                            const SizedBox(height: 16),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.searchItems.length,
                              itemBuilder: (context, index){
                                return SearchItem(
                                  searchItemModel: state.searchItems[index],
                                  onPressed: () {
                                    state.searchItems[index].delete();
                                    BlocProvider.of<SearchCubit>(context).getSearchHistory(context);
                                  },
                                );
                              },
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
            ),
            if (searchWord != null && searchWord!.isNotEmpty)
              productsBlocBuilder()
            else
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Text(S.of(context).nosearchresult, style: Styles.regular13),
                    const SizedBox(height: 12),
                    Image.asset(Assets.imagesSearchimg),
                  ],
                ),
              ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        ),
      ),
    );
  }
}
