import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/models/models.dart';

final searchProvider =
    StateNotifierProvider<SearchNotifier, Search>((ref) => SearchNotifier());

class SearchNotifier extends StateNotifier<Search> {
  SearchNotifier() : super(const Search(category: Category.none, subCategory: SubCategory.none, eventName: EventName.undefined, course: Course.undefined));

  void reloadSearch(Category value) {
    state = state.copyWith(category: value);
  }

  void selectedCategory(Category selectCategoryName) {
    state = state.copyWith(category: selectCategoryName, subCategory: SubCategory.none);
  }

  void selectedYear(int selectYear) {
    state = state.copyWith(year: selectYear);
  }

  void selectedEventName(EventName selectEventName) {
    state = state.copyWith(eventName: selectEventName);
  }

  void selectedCourse(Course selectCourse) {
    state = state.copyWith(course: selectCourse);
  }

  void selectedSubCategory(SubCategory selectSubCategory) {
    state = state.copyWith(subCategory: selectSubCategory);
  }

  void deleteAllParameters(){
    state = state.copyWith(year: null,eventName: EventName.undefined,course: Course.undefined,subCategory: SubCategory.none,category: Category.none,searchWord: null);
  }

  void deleteParameter(String parameterName){
    switch(parameterName){
      case 'year':
        state = state.copyWith(year: null);
        break;
      case 'eventName':
        state = state.copyWith(eventName: EventName.undefined);
        break;
      case 'course':
        state = state.copyWith(course: Course.undefined);
        break;
      case 'subCategory':
        state = state.copyWith(subCategory: SubCategory.none);
        break;
      case 'category':
        state = state.copyWith(category: Category.none, subCategory: SubCategory.none);
        break;
      case 'searchWord':
        state = state.copyWith(searchWord: null);
        break;
    }
  }

  void addKeyWord(List<String> word){
    state = state.copyWith(searchWord: word);
  }

  void setParameters(Search search){
    state = search;
  }

  void deleteWord(int index){
    final List<String> word = state.searchWord!.where((content) => state.searchWord!.indexOf(content) != index).toList();
    state = state.copyWith(searchWord: word);
  }

}
