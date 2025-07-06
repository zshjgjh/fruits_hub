import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utilis/constants.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/search_item_model.dart';
import '../../views/search_view.dart';

part 'search_state.dart';

var searchBox = Hive.box<SearchItemModel>(kSearchHistory); //global not to open multiple times

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void addSearchItem({required SearchItemModel searchItemModel}) {
    emit(SearchLoading());
    try {
      searchBox.add(searchItemModel);
      emit(SearchSuccess(searchItems: []));
    } catch (e) {
      emit(SearchFailure(errorMessage: 'Fail to add to history'));
    }
  }

  void getSearchHistory(context) {
    emit(SearchLoading());
    try {
      List<SearchItemModel> searchItems = searchBox.values.toList();
      emit(SearchSuccess(searchItems: searchItems));
    } catch (e) {
      emit(SearchFailure(errorMessage: S
          .of(context)
          .failfetchsearchhistory));
    }
  }

  void deleteSearchHistory(context, {required SearchItemModel searchItemModel}) {
    emit(SearchLoading());
    try {
      searchItemModel.delete();
      // هنا جلب القائمة الجديدة بعد الحذف
      final searchItems = searchBox.values.toList();
      emit(SearchSuccess(searchItems: searchItems));
    } catch (e) {
      emit(SearchFailure(errorMessage: S
          .of(context)
          .failfetchsearchhistory));
    }
  }


}

