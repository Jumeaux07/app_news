import 'package:app_news/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key, @required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withAlpha(100),
      items: [
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(left: 50),
            child: IconButton(
              onPressed: (){
                Get.toNamed(AppPages.INITIAL);
              }, 
              icon: Icon(Icons.home),
                ),
              ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: (){
              Get.toNamed(AppPages.SEARCH);
            }, 
            icon: Icon(Icons.search),
            ),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(right: 50),
            child: IconButton(
              onPressed: (){
                Get.toNamed(AppPages.PROFILE);
              }, 
              icon: Icon(Icons.person),
                ),
              ),
          label: "Profile",
        ),
      ],
    );
  }
}
