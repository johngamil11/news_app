import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;

  static const int settings = 2;

  Function onSideFunctionClick;

  HomeDrawer({required this.onSideFunctionClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.07),
          width: double.infinity,
          color: AppColors.green,
          child: Text(
            'News App!',
            style:
                Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 22),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              onSideFunctionClick(categories);
            },
            child: Row(
              children: [
                Icon(
                  Icons.list,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Categories',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 24,
                        color: AppColors.black,
                      ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              onSideFunctionClick(settings);
            },
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Settings',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 24,
                        color: AppColors.black,
                      ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
