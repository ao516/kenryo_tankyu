import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'search.dart';

final searchProvider =
    StateNotifierProvider<SearchNotifier, Search>((ref) => SearchNotifier());

class SearchNotifier extends StateNotifier<Search> {
  SearchNotifier() : super(const Search());

  void reloadSearch(String value) {
    state = state.copyWith(category: value);
    if (kDebugMode) {
      print('通ってるよ！');
    }
  }

  void selectedYear(String selectYear) {
    state = state.copyWith(year: selectYear);
  }

  void selectedEventName(String selectEventName) {
    state = state.copyWith(eventName: selectEventName);
  }

  void selectedDeparture(String selectDeparture) {
    state = state.copyWith(departure: selectDeparture);
  }

  void deleteParameter(){
    state = state.copyWith(year: null,eventName: null,departure: null);
  }
}
