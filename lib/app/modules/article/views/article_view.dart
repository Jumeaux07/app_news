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
            _NewsHeadLine(article: article,)
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
              article['content'],
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
