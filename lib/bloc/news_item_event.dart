part of 'news_item_bloc.dart';

abstract class NewsItemEvent extends Equatable {
  const NewsItemEvent();

}

class NewsItemLoadDataEvent extends NewsItemEvent {
  @override
  List<Object?> get props => [];
}



