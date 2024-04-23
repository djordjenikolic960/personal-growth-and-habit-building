import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entity/category.dart';
import 'choose_category_event.dart';
import 'choose_category_state.dart';

class ChooseCategoryBloc
    extends Bloc<ChooseCategoryEvent, ChooseCategoryState> {
  final List<Category> _selectedCategories = [];

  ChooseCategoryBloc() : super(CategoriesUpdated(const [])) {
    on<CategorySelected>(_onCategorySelected);
    on<CategoryDeselected>(_onCategoryDeselected);
    on<SaveCategories>(_onSaveCategories);
  }

  FutureOr<void> _onCategorySelected(
    CategorySelected event,
    Emitter<ChooseCategoryState> emit,
  ) {
    _selectedCategories.add(event.category);
    emit(CategoriesUpdated(List.from(_selectedCategories)));
  }

  FutureOr<void> _onCategoryDeselected(
    CategoryDeselected event,
    Emitter<ChooseCategoryState> emit,
  ) {
    _selectedCategories.removeWhere(
        (category) => category.category.name == event.category.category.name);
    emit(CategoriesUpdated(List.from(_selectedCategories)));
  }

  FutureOr<void> _onSaveCategories(
    SaveCategories event,
    Emitter<ChooseCategoryState> emit,
  ) {
    //todo emit use case to save this to pref of db
    /*final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Assuming Category can be easily converted to/from JSON
    List<String> jsonList = selectedCategories
        .map((category) =>
        jsonEncode({'id': category.id, 'name': category.name}))
        .toList();
    await prefs.setStringList('selectedCategories', jsonList);*/
  }
}
