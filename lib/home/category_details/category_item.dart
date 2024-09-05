import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/model/category.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  int index;

  CategoryItem({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(index % 2 != 0 ? 25 : 0),
            bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )),
      child: Column(
        children: [
          Image.asset(
            category.imagePath,
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.white, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
