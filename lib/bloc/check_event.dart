part of 'check_bloc.dart';

abstract class CheckEvent extends Equatable {
  const CheckEvent();
}

class CheckLoadDataEvent extends CheckEvent {
  @override
  List<Object?> get props => [];
}
