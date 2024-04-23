import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/category.dart';

@immutable
abstract interface class ChooseCategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategorySelected extends ChooseCategoryEvent {
  final Category category;

  CategorySelected(this.category);

  @override
  List<Object?> get props => [category];
}

class CategoryDeselected extends ChooseCategoryEvent {
  final Category category;

  CategoryDeselected(this.category);

  @override
  List<Object?> get props => [category];
}

class SaveCategories extends ChooseCategoryEvent {}
