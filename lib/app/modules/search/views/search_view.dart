import 'package:app_news/app/modules/home/controllers/home_controller.dart';
import 'package:app_news/app/routes/app_pages.dart';
import 'package:app_news/widgets/bottom_navbar.dart';
import 'package:app_news/widgets/image_container.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  final SearchController _searchController = Get.find<SearchController>();
  final storage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      initialIndex: 0,
      length: _searchController.categorie.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Icon(Icons.menu,color: Colors.black,),
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: BottomNavBar(index: 1),
        body:ListView(
          padding: EdgeInsets.all(20),
          children: [
            _DiscoverNews(),
            _CategoryNews(tabs: _searchController.categorie, articles: storage.read("articles"),),
          ],
        )
      ),
    );
  }
}

class _CategoryNews extends StatelessWidget {
  _CategoryNews({
    Key key, @required this.tabs, @required this.articles
  }) : super(key: key);
final List<String> tabs;
  final List<dynamic> articles;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          indicatorColor: Colors.black,
          tabs: tabs.map((tab) => Tab(
            icon: Text(tab,style: TextStyle(color: Colors.black, fontSize: 17),),
            )
          ).toList(),
        ),
        SizedBox(
          height: Get.height,
          child:TabBarView(
            children: tabs.map(
              (tab) => ListView.builder(
                shrinkWrap: true,
                itemCount: articles.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: () {
                      Get.toNamed(AppPages.ARTICLE, arguments: articles[index]);
                    },
                    child: Row(
                      children: [
                        ImageContainer(
                          width: 80, 
                          height: 80,
                          margin: EdgeInsets.all(10),
                          borderRadius: 5,
                          imageUrl: articles[index]['image_url']
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                articles[index]['title'], 
                                maxLines: 2, 
                                overflow: TextOverflow.clip,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              SizedBox(height:20),
                              Row(
                                children: [
                                  Icon(Icons.schedule, size: 18,),
                                  SizedBox(width: 5,),
                                  Text(articles[index]['pubDate'])
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              )
            ).toList(),
          ),
        )
      ],
    );
  }
}

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height*0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Discover",
            style: Theme.of(context).textTheme.headline3.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          Text(
            "News from all over the world",
            style: Theme.of(context).textTheme.headline6.copyWith(
              color:Colors.grey.shade500
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            cursorColor: Colors.black,
            style:TextStyle(
              color: Colors.black
            ),
            decoration: InputDecoration(
              hintText: "Search",
              fillColor: Colors.grey.shade300,
              filled: true,
              border: OutlineInputBorder(
                borderRadius:BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.search),
              suffixIcon: RotatedBox(
                quarterTurns: 1,
                child: Icon(Icons.tune),
              )
            ),
          )
        ],
      ),
    );
  }
}
