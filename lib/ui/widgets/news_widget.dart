import 'package:flutter/material.dart';

import '../../services/local_notification_service.dart';
import '../../utils/routes.dart';
import 'news_item.dart';

SafeArea newsWidget(List<dynamic> posts, List<dynamic> comments,LocalNotificationService service) {
  return SafeArea(
      child: Container(
    color: Colors.black,
    child: ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () async{
            Navigator.pushNamed(
              context,
              Routes.newsItemPage,
              arguments: {
                'index': index,
                'title': posts[index]["title"],
                'content': posts[index]["body"],
                'comments': comments,
              },
            );
            await service.showNotification(
                          id: 5,
                          title: 'Post ID: $index',
                          body: posts[index]["title"]);
          },
          child: newsItem(posts[index]["title"], posts[index]["body"]),
        );
      },
    ),
  ));
  ;
}
