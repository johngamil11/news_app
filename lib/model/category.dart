import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';

class Category {
  String id;

  String title;

  String imagePath;

  Color color;

  Category(
      {required this.title, required this.color, required this.id, required this.imagePath});

/*
    technology
 */
  static List <Category> getCategories() {
    return [
      Category(title: 'Sports',
          color: AppColors.red,
          id: 'sports',
          imagePath: 'assets/images/sports.png'),
      Category(title: 'General',
          color: AppColors.darkBlue,
          id: 'general',
          imagePath: 'assets/images/Politics.png'),
      Category(title: 'Health',
          color: AppColors.pink,
          id: 'health',
          imagePath: 'assets/images/health.png'),
      Category(title: 'Business',
          color: AppColors.darkGold,
          id: 'business',
          imagePath: 'assets/images/bussines.png'),
      Category(title: 'Entertainment',
          color: AppColors.babyBlue,
          id: 'entertainment',
          imagePath: 'assets/images/environment.png'),
      Category(title: 'Science',
          color: AppColors.yellow,
          id: 'science',
          imagePath: 'assets/images/science.png'),
      Category(title: 'Technology',
          color: AppColors.darkBlue,
          id: 'technology',
          imagePath: 'assets/images/science.png'),
    ];
  }


}
