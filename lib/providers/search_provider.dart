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

  void selectedCategory(String selectCategoryName) {
    state = state.copyWith(category: selectCategoryName, subCategory: null);
  }

  void selectedYear(int selectYear) {
    state = state.copyWith(year: selectYear);
  }

  void selectedEventName(String selectEventName) {
    state = state.copyWith(eventName: selectEventName);
  }

  void selectedCourse(String selectCourse) {
    state = state.copyWith(course: selectCourse);
  }

  void selectedSubCategory(String selectSubCategory) {
    state = state.copyWith(subCategory: selectSubCategory);
  }

  void deleteAllParameters(){
    state = state.copyWith(year: null,eventName: null,course: null,subCategory: null,category: null);
  }

  void deleteParameter(String parameterName){
    switch(parameterName){
      case 'year':
        state = state.copyWith(year: null);
        break;
      case 'eventName':
        state = state.copyWith(eventName: null);
        break;
      case 'course':
        state = state.copyWith(course: null);
        break;
      case 'subCategory':
        state = state.copyWith(subCategory: null);
        break;
      case 'category':
        state = state.copyWith(category: null, subCategory: null);
        break;
      case 'searchWord':
        state = state.copyWith(searchWord: null);
        break;
    }
  }

  void addKeyWord(String words){
    final List<String> word = words.replaceAll("　", " ").split(" "); //検索ワードを空白で区切る
    word.removeWhere((content) => content == ' ' || content == '　'); //検索ワードに余分に空白が入っていた場合、消去する todo しっかり機能していないかも。
    state = state.copyWith(searchWord: word);
  }

  void deleteWord(int index){
    final List<String> word = state.searchWord!.where((content) => state.searchWord!.indexOf(content) != index).toList();
    //TODO まじで上の文なんでこんなになるかわからないけど、できてる笑。すげぇ。（感想）
    //TODO 多分mapとか、リストの型変換とかそのあたりの理解が薄いんだろうな
    state = state.copyWith(searchWord: word);
  }

}
