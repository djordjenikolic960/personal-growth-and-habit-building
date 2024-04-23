import 'package:flutter/cupertino.dart';

import '../../entity/category.dart';

abstract interface class CategoryManager {
  List<Category> initializeCategories(BuildContext context);
}
