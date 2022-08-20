part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({required this.bottomNavIndex});
  final int bottomNavIndex;
  @override
  List<Object> get props => [bottomNavIndex];
}
