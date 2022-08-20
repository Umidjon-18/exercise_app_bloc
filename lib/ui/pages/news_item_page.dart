import 'package:exercise_app/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/news_item_bloc.dart';
import '../../utils/routes.dart';
import '../widgets/comment_item.dart';

class NewsItemPage extends StatelessWidget {
  const NewsItemPage({required this.index, required this.title, required this.content, Key? key}) : super(key: key);

  final int index;
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.bgColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Constants.bottomNavBarColor,
          title: Text(title),
        ),
        body: BlocBuilder<NewsItemBloc, NewsItemState>(
          builder: (context, state) {
            if (state is NewsItemIsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NewsItemIsError) {
              return const Center(child: Text('Error'));
            } else if (state is NewsItemIsLoaded) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    child: Text(
                      content,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int i) {
                          return commentItem(index, state.comments, i);
                        },
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      Routes.commentPage,
                      arguments: {
                        "commentIndex": index,
                        "postTitle": title,
                        "comments": state.comments,
                      },
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 30, right: 20),
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 84, 12, 227),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Show me 5 results',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Icon(
                            Icons.remove_red_eye,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              context.read<NewsItemBloc>().add(NewsItemLoadDataEvent());
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
