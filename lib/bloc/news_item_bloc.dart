import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:exercise_app/model/comment_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';


part 'news_item_event.dart';
part 'news_item_state.dart';

class NewsItemBloc extends Bloc<NewsItemEvent, NewsItemState> {
  NewsItemBloc() : super(const NewsItemInitial()) {
    on<NewsItemLoadDataEvent>((event, emit)async {
      emit(const NewsItemIsLoading());
      try {
        var response = await get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
        if (response.statusCode == 200) {
          List list = jsonDecode(response.body);
          List<CommentModel> comments = [];
          for (var item in list) {
            comments.add(CommentModel.fromJson(item));
          }
          emit(NewsItemIsLoaded(comments: comments));
        }else {
        emit(const NewsItemIsError(errorMessage: "Something went wrong"));
        }
      } catch (e) {
        emit(const NewsItemIsError(errorMessage: 'Error'));
      }
    });
  }
}
