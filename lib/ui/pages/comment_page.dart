import 'package:flutter/material.dart';

import '../../utils/contants.dart';
import '../widgets/comment_item.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({required this.commentIndex,required this.postTitle,required this.comments,Key? key}) : super(key: key);
  final int commentIndex;
  final String postTitle;
  final List<dynamic> comments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Constants.bottomNavBarColor,
        title: Text(postTitle),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return commentItem(commentIndex, comments, index);
                },
              ),
            ),
          ),
          ],
      ),
    
    );
  }
}
