import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/tabs/tabs_widget.dart';
import 'package:news_app/model/SourceResponse.dart';

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
          title: Text('News App', style: Theme.of(context).textTheme.titleLarge ),
        ),
        body: FutureBuilder<SourceResponse?>(
            future: ApiManager.getSources(),
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
                      ApiManager.getSources();
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
                      ApiManager.getSources();
                    }, child: Text('Try again'))
                  ],
                );
              }
              var sourcesList = snapshot.data!.sources! ;
              return TabsWidget(sourceList: sourcesList);

            }),

    )
      ]
    );
  }
}