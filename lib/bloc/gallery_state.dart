part of 'gallery_bloc.dart';

abstract class GalleryState extends Equatable {
  const GalleryState();
}

class GalleryInitial extends GalleryState {
  @override
  List<Object?> get props => [];
}

class GalleryIsLoading extends GalleryState {
  @override
  List<Object?> get props => [];
}

class GalleryIsLoaded extends GalleryState {
  const GalleryIsLoaded({required this.gallery});
  final List<GalleryModel> gallery;
  @override
  List<Object?> get props => [gallery];
}

class GalleryIsError extends GalleryState {
  const GalleryIsError({required this.errorMessage});
  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
}
