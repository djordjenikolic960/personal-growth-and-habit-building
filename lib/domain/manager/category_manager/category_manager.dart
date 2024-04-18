import 'package:flutter/cupertino.dart';

import '../../model/category.dart';

abstract interface class CategoryManager {
  List<Category> initializeCategories(BuildContext context);
}
