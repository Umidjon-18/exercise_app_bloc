import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:exercise_app/model/news_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(const NewsInitial()) {
    on<NewsLoadDataEvent>((event, emit) async {
      emit(const NewsIsLoading());
      try {
        var response = await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
        if (response.statusCode == 200) {
          List list = jsonDecode(response.body);
          List<NewsModel> news = [];
          for (var item in list) {
            news.add(NewsModel.fromJson(item));
          }
          emit(NewsIsLoaded(news: news));
        }else {
        emit(const NewsIsError(errorMessage: "Something went wrong"));
        }
      } catch (e) {
        emit(const NewsIsError(errorMessage: 'Error'));
      }
    });
  }
}
