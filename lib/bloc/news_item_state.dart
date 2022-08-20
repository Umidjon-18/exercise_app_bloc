part of 'news_item_bloc.dart';

abstract class NewsItemState extends Equatable {
  const NewsItemState();
}

class NewsItemInitial extends NewsItemState {
  const NewsItemInitial();
  @override
  List<Object?> get props => [];
}

class NewsItemIsLoading extends NewsItemState {
  const NewsItemIsLoading();
  @override
  List<Object?> get props => [];
}

class NewsItemIsLoaded extends NewsItemState {
  const NewsItemIsLoaded({required this.comments});
  final List<CommentModel> comments;
  @override
  List<Object?> get props => [comments];
}

class NewsItemIsError extends NewsItemState {
  const NewsItemIsError({required this.errorMessage});
  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
}
