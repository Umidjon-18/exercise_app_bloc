part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class NewsLoadDataEvent extends NewsEvent {
  const NewsLoadDataEvent();
  
  @override
  List<Object?> get props => [];
}
