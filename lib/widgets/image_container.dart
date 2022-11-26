import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ImageContainer extends StatelessWidget {
 ImageContainer({
    Key key, @required this.width, this.height =125, @required this.imageUrl, this.padding, this.margin, this.borderRadius = 20, this.child,
  }) : super(key: key);

  final double width;
  final double height;
  final String imageUrl;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double borderRadius;
  final Widget child;
  final storage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return storage.read("stateConnect") != 0?
    Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image:DecorationImage(
          image: NetworkImage(imageUrl==null ? 'https://i-invdn-com.investing.com/news/LYNXNPEC180BO_L.jpg' : imageUrl,),
          fit: BoxFit.cover
        )
      ),
      child: child,
    ):
    Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image:DecorationImage(
          image: AssetImage("assets/images/LYNXNPEC180BO_L.jpg"),
          fit: BoxFit.cover
        )
      ),
      child: child,
    );
  }
}