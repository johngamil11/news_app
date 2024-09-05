import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/category_details/category_details.dart';
import 'package:news_app/home/category_details/category_fragment.dart';
import 'package:news_app/home/settings/settings.dart';
import 'package:news_app/home/tabs/tabs_widget.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/category.dart';

import 'drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String RouteName = 'home_screen' ;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Container(
        color: AppColors.white,
        child: Image.asset('assets/images/pattern.png' ,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,),
      ),
      Scaffold(
      backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height*0.09,
            title: Text(
                selectedNewItem == HomeDrawer.settings
                    ? 'Settings'
                    : selectedCategory == null
                        ? 'News App'
                        : selectedCategory!.title,
                style: Theme.of(context).textTheme.titleLarge),
          ),
          drawer: Drawer(
            child: HomeDrawer(
              onSideFunctionClick: onSideMenuItemClick,
            ),
          ),
          body: selectedNewItem == HomeDrawer.settings
              ? Settings()
              : selectedCategory == null
                  ? CategoryFragment(
                      onCategoryItemClick: onCategoryItemClick,
                    )
                  : CategoryDetails(
                      category: selectedCategory!,
                    ))
    ]);
  }

  Category? selectedCategory;

  void onCategoryItemClick(Category newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }

  int selectedNewItem = HomeDrawer.categories;

  void onSideMenuItemClick(int newSideMenuItem) {
    selectedNewItem = newSideMenuItem;
    Navigator.pop(context);
    selectedCategory = null;
    setState(() {});
  }
}