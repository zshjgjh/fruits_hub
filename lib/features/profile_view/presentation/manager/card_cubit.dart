import 'package:bloc/bloc.dart';
import 'package:fruits_hub/core/utilis/constants.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../data/models/card_model.dart';

part 'card_state.dart';
var cardBox = Hive.box<CardModel>(kCards);
class CardCubit extends Cubit<CardState> {
  CardCubit() : super(CardInitial());

  void getCards() {
    emit(CardLoading());
    try {
      final cards = cardBox.values.toList();
      emit(CardSuccess(cards: cards));
    } catch (e) {
      emit(CardFailure(errorMessage: ''));
    }
  }

  void addCard({required CardModel card})  {
    emit(CardLoading());
    try {
      cardBox.add(card);
      final cards = cardBox.values.toList();
      emit(CardSuccess(cards: cards));
    } catch (e) {
      emit(CardFailure(errorMessage: ''));
    }
  }

  void deleteCard({required CardModel card})   {
    emit(CardLoading());
    try {
      cardBox.delete(card);
      emit(CardSuccess(cards: []));
    } catch (e) {
      emit(CardFailure(errorMessage: ''));
    }
  }
}
