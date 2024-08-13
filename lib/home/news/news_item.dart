import 'package:flutter/material.dart';

import '../../model/NewsRespose.dart';

class NewsItem extends StatelessWidget {
News news ;
NewsItem({required this.news});
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25)
            ),
            child: Image.network(news.urlToImage??''),
          )
        ],
      ),
    );
  }
}
