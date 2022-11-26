import 'package:app_news/widgets/custom_tag.dart';
import 'package:app_news/widgets/image_container.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/article_controller.dart';

class ArticleView extends GetView<ArticleController> {
  final article = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      width: double.infinity, 
      imageUrl: article['image_url'],
      child: Scaffold(
        backgroundColor:Colors.transparent ,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          children: [
            _NewsHeadLine(article: article,),
            Container(
              height: Get.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), 
                  topRight: Radius.circular(20)  
                ),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomTag(
                        backgrounColor: Colors.black, 
                        children: [
                          ImageContainer(
                            width: 30, 
                            height: 30,
                            borderRadius: 50,
                            imageUrl: article['image_url']
                          ),
                          SizedBox(width:10),
                          article['keywords'] !=null?
                          Text(article['keywords'][0], 
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ):Text(""),
                        ]
                      ),
                      Row(
                        children: [
                          Icon(Icons.schedule),
                        Text(article['pubDate'])
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Text(
                    article['title'],
                    maxLines: 2, 
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 30,),
                  Text(
                    article['content'], 
                    overflow: TextOverflow.clip,
                    maxLines: 35,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NewsHeadLine extends StatelessWidget {
  const _NewsHeadLine({
    Key key, @required this.article,
  }) : super(key: key);
  final article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: Get.height*0.15,),
          CustomTag(
              backgrounColor: Colors.grey.withAlpha(150), 
              children: [
                Text("Categorie",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Colors.white
                  )
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              article['title'],
              style: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 15,),
            Text(
              article['description'],
              maxLines: 3,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
