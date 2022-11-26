import 'package:app_news/app/modules/network/controllers/network_controller.dart';
import 'package:app_news/app/routes/app_pages.dart';
import 'package:app_news/widgets/bottom_navbar.dart';
import 'package:app_news/widgets/custom_tag.dart';
import 'package:app_news/widgets/image_container.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  Future<void>_refresh()async {
    final NetworkController _networkController = Get.find<NetworkController>();
    _networkController.onInit();
     await Get.toNamed(AppPages.INITIAL);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.menu,color: Colors.white,),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: const BottomNavBar(index: 0,),
      extendBodyBehindAppBar: true,
      body:  controller.obx((data)=> LiquidPullToRefresh(
        color: Colors.purple[200],
        backgroundColor: Colors.purple,
        height: Get.height *0.30,
        showChildOpacityTransition: false,
        onRefresh: _refresh,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _NewsOfDay(article: data),
            _BreakingNews(articles: data)
          ],
        ),
      ),)
    );
  }
}

class _BreakingNews extends StatelessWidget {
  const _BreakingNews({
    Key key, @required this.articles,
  }) : super(key: key);

  final dynamic articles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Breaking News',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'plus',
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height:25),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: articles.length,
                itemBuilder: (BuildContext context,int index){
                  return Container(
                    width: Get.width*0.5,
                    margin: EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(
                          AppPages.ARTICLE,
                          arguments: articles[index]
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageContainer(
                            width: Get.width*0.5, 
                            imageUrl: articles[index]['image_url']
                          ),
                          Text(
                            articles[index]['title'],
                            maxLines: 2,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(height:20),
                          Text(
                            articles[index]['pubDate'],
                            maxLines: 2,
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Text(
                            "auteur",
                            maxLines: 2,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  );
                },

              ),
            )
        ],
      ),
    );
  }
}

class _NewsOfDay extends StatelessWidget {
  const _NewsOfDay({
    Key key, @required this.article,
  }) : super(key: key);

  final dynamic article;

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      padding: EdgeInsets.all(10.0),
      imageUrl: article[0]['image_url'],
      height: Get.height*0.45,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTag(
            backgrounColor: Colors.grey.withAlpha(150), 
            children: [
              Text('News Du Jour',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Colors.white
                )
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            article[0]['title'],
            style: Theme.of(context).textTheme.headline6.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          TextButton(
            onPressed: (){},
            style: TextButton.styleFrom(
              padding:EdgeInsets.zero
            ),
            child: Row(
              children: [
                Text('Lire plus',
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: Colors.white
                  ),
                ),
                SizedBox(width: 20,),
                Icon(Icons.arrow_right_alt,color: Colors.white)
              ],
            )
          ),
        ],
      ),
    );
  }
}