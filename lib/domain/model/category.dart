import 'package:equatable/equatable.dart';
import 'categories.dart';
import 'task.dart';

class Category extends Equatable {
  final PersonalGrowCategories category;
  final List<Task> tasks;

  const Category(
    this.category,
    this.tasks,
  );

  @override
  List<Object?> get props => [
        category,
        tasks,
      ];
}
