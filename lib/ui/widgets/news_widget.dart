import 'package:flutter/material.dart';

import '../../utils/routes.dart';
import 'news_item.dart';

SafeArea newsWidget(List<dynamic> posts, List<dynamic> comments) {
  return SafeArea(
      child: Container(
    color: Colors.black,
    child: ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            Routes.newsItemPage,
            arguments: {
              'index': index,
              'title': posts[index]["title"],
              'content': posts[index]["body"],
              'comments': comments,
            },
          ),
          child: newsItem(posts[index]["title"], posts[index]["body"]),
        );
      },
    ),
  ));
  ;
}
