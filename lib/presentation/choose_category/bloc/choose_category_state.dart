import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/category.dart';

@immutable
abstract interface class ChooseCategoryState extends Equatable {}

class CategoriesUpdated extends ChooseCategoryState {
  final List<Category> selectedCategories;

  CategoriesUpdated(this.selectedCategories);

  @override
  List<Object?> get props => [selectedCategories];
}
