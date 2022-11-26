import 'package:get/get.dart';

import 'package:app_news/app/modules/article/bindings/article_binding.dart';
import 'package:app_news/app/modules/article/views/article_view.dart';
import 'package:app_news/app/modules/home/bindings/home_binding.dart';
import 'package:app_news/app/modules/home/views/home_view.dart';
import 'package:app_news/app/modules/network/bindings/network_binding.dart';
import 'package:app_news/app/modules/network/views/network_view.dart';
import 'package:app_news/app/modules/profile/bindings/profile_binding.dart';
import 'package:app_news/app/modules/profile/views/profile_view.dart';
import 'package:app_news/app/modules/search/bindings/search_binding.dart';
import 'package:app_news/app/modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static const SEARCH = Routes.SEARCH;
  static const PROFILE = Routes.PROFILE;
  static const ARTICLE = Routes.ARTICLE;
  static const NETWORK = Routes.NETWORK;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE,
      page: () => ArticleView(),
      binding: ArticleBinding(),
    ),
    GetPage(
      name: _Paths.NETWORK,
      page: () => NetworkView(),
      binding: NetworkBinding(),
    ),
  ];
}
