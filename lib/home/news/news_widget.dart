import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/news/news_item.dart';
import 'package:news_app/model/NewsRespose.dart';
import 'package:news_app/model/SourceResponse.dart';

import '../../app_colors.dart';

class NewsWidget extends StatefulWidget {
 Sources source ;
NewsWidget ({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsRespose?>(
        future: ApiManager.getNewsBySourceID(widget.source.id ?? ''),
        builder: (context ,snapshot ){
          if (snapshot.connectionState == ConnectionState.waiting ){
            return Center(child: CircularProgressIndicator(
              color: AppColors.green,
            ),);
          } else if (snapshot.hasError){
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(onPressed: (){
                  ApiManager.getNewsBySourceID(widget.source.id??"");
                  setState(() {

                  });
                }, child: Text('Try again'))
              ],
            );
          }
          ///server => success , error
          if (snapshot.data!.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: (){
                  ApiManager.getNewsBySourceID(widget.source.id??"");
                }, child: Text('Try again'))
              ],
            );
          }
          var newsList = snapshot.data!.articles! ;
          return ListView.builder(itemBuilder: (context , index) {
            return NewsItem(news: newsList[index]);
          },
          itemCount: newsList.length,);

        });
  }

}
