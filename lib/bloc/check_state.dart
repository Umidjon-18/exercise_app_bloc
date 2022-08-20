part of 'check_bloc.dart';


abstract class CheckState extends Equatable {
  const CheckState();
}

class CheckInitial extends CheckState {
  @override
  List<Object?> get props => [];
}

class CheckIsLoading extends CheckState {
  @override
  List<Object?> get props => [];
}

class CheckIsLoaded extends CheckState {
  const CheckIsLoaded({required this.check});
  final List<CheckModel> check;
  @override
  List<Object?> get props => [check];
}

class CheckIsError extends CheckState {
  const CheckIsError({required this.errorMessage});
  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
}
