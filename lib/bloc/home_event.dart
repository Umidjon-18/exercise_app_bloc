part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

}

class HomeEventChange extends HomeEvent {
  const HomeEventChange({required this.selectedIndex});
  final int selectedIndex;
  
  @override
  List<Object?> get props => [selectedIndex];
  
}
