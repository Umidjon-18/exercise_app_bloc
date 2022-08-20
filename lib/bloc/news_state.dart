part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {
  const NewsInitial();
  @override
  List<Object> get props => [];
}

class NewsIsLoading extends NewsState {
  const NewsIsLoading();
  @override
  List<Object> get props => [];
}

class NewsIsLoaded extends NewsState {
  const NewsIsLoaded({required this.news});
  final List<NewsModel> news;
  @override
  List<Object> get props => [news];
}

class NewsIsError extends NewsState {
  const NewsIsError({required this.errorMessage});
  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];
}
