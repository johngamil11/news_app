import 'package:flutter/material.dart';
import 'package:news_app/home/news/news_widget.dart';
import 'package:news_app/home/tabs/tab_item.dart';

import '../../model/SourceResponse.dart';

class TabsWidget extends StatefulWidget {
  List<Sources> sourceList ;

TabsWidget({required this.sourceList});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index){
                selectedIndex = index ;
                setState(() {

                });
              },
              isScrollable: true,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                tabs:
                widget.sourceList.map((Sources) => TabItem(source: Sources,
                    isSelected: selectedIndex == widget.sourceList.indexOf(Sources) ,))
                    .toList()
            ),
            Expanded(child: NewsWidget(source: widget.sourceList[selectedIndex]))
          ],
        ));
  }
}
