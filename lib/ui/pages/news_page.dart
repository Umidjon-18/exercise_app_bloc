import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/news_bloc.dart';
import '../../services/local_notification_service.dart';
import '../../utils/routes.dart';
import '../widgets/loading_widgets/news_loading.dart';
import '../widgets/news_item.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late final LocalNotificationService service;

  @override
  void initState() {
    super.initState();
    service = LocalNotificationService();
    service.intialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
      if (state is NewsInitial) {
        context.read<NewsBloc>().add(const NewsLoadDataEvent());
        return const SizedBox.shrink();
      } else if (state is NewsIsLoading) {
        return newsLoadingWidget();
      } else if (state is NewsIsLoaded) {
        return SafeArea(
            child: Container(
          color: Colors.black,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: state.news.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () async {
                  Navigator.pushNamed(
                    context,
                    Routes.newsItemPage,
                    arguments: {
                'index': index,
                'title': state.news[index].title,
                'content': state.news[index].body,
              },
                  );
                  await service.showNotification(
                      id: 5,
                      title: 'Post ID: ${index + 1}',
                      body: state.news[index].title??"Empty");
                },
                child: newsItem(state.news[index].title, state.news[index].body),
              );
            },
          ),
        ));
      } else {
        return const Center(
          child: Text('Error'),
        );
      }
    });
  }
}
