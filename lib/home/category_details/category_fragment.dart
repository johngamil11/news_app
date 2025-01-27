import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';

import '../../model/category.dart';
import 'category_item.dart';

class CategoryFragment extends StatelessWidget {
  var categoreisList = Category.getCategories();
  Function onCategoryItemClick;

  CategoryFragment({required this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pick your category \nof interest',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: AppColors.grey, fontSize: 22),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onCategoryItemClick(categoreisList[index]);
                    },
                    child: CategoryItem(
                      category: categoreisList[index],
                      index: index,
                    ));
              },
              itemCount: categoreisList.length,
            ),
          )
        ],
      ),
    );
  }
}
