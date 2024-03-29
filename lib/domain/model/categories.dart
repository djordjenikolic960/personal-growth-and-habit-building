enum PersonalGrowCategories {
  mindfulnessAndWellBeing,
  physicalHealth,
  personalDevelopment,
  creativityAndLearning,
  productivityAndOrganization,
  socialAndEmotionalWellBeing
}

extension WellBeingCategoryExtension on PersonalGrowCategories {
  String get name {
    switch (this) {
      case PersonalGrowCategories.mindfulnessAndWellBeing:
        return "Mindfulness & Well-being";
      case PersonalGrowCategories.physicalHealth:
        return "Physical Health";
      case PersonalGrowCategories.personalDevelopment:
        return "Personal Development";
      case PersonalGrowCategories.creativityAndLearning:
        return "Creativity & Learning";
      case PersonalGrowCategories.productivityAndOrganization:
        return "Productivity & Organization";
      case PersonalGrowCategories.socialAndEmotionalWellBeing:
        return "Social & Emotional Well-being";
      default:
        return "Unknown Category";
    }
  }
}
