import 'package:exercise_app/ui/pages/gallery_page.dart';
import 'package:exercise_app/ui/pages/home_page.dart';
import 'package:exercise_app/ui/pages/news_item_page.dart';
import 'package:flutter/material.dart';

import '../ui/pages/comment_page.dart';
import '../ui/pages/contact_page.dart';

class Routes {
  static const newsPage = '/';
  static const galleryPage = '/gallery';
  static const contactPage = '/contact';
  static const newsItemPage = '/newsItem';
  static const commentPage = '/comment';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    try {
      Map<String, dynamic>? args =
          routeSettings.arguments as Map<String, dynamic>?;
      args ?? <String, dynamic>{};
      switch (routeSettings.name) {
        case newsPage:
          return MaterialPageRoute(builder: (context) => const HomePage());
        case galleryPage:
          return MaterialPageRoute(
            builder: (
              context,
            ) =>
                GalleryPage(
              pageTitle: args?['pageTitle'],
            ),
          );
        case contactPage:
          return MaterialPageRoute(
            builder: (
              context,
            ) =>
                ContactPage(
              userData: args?['userData'],
            ),
          );
        case newsItemPage:
          return MaterialPageRoute(
            builder: (
              context,
            ) =>
                NewsItemPage(
              index: args?['index'],
              title: args?['title'],
              content: args?['content'],
              comments: args?['comments'],
            ),
          );
        case commentPage:
          return MaterialPageRoute(
            builder: (
              context,
            ) =>
                CommentPage(
              commentIndex: args?['commentIndex'],
              postTitle: args?['postTitle'],
              comments: args?['comments'],
            ),
          );

        default:
          return MaterialPageRoute(builder: (context) => const HomePage());
      }
    } catch (e) {
      return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
