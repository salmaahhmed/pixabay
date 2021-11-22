part of 'combined_bloc.dart';

abstract class GetCombinedState extends Equatable {
  const GetCombinedState();

  @override
  List<Object> get props => [];
}

class GetCombinedInitial extends GetCombinedState {}

class GetCombinedLoading extends GetCombinedState {}

class GetCombinedSuccess extends GetCombinedState {
  final List<dynamic> combined;
  final bool hasReachedEnd;
  GetCombinedSuccess({
    required this.combined,
    required this.hasReachedEnd,
  });

  @override
  List<Object> get props => [this.combined, this.hasReachedEnd];
}

class GetCombinedFail extends GetCombinedState {
  final String error;

  GetCombinedFail(this.error);

  @override
  List<Object> get props => [this.error];
}

class CombinedEndResult extends GetCombinedState {
  final String error;

  CombinedEndResult(this.error);

  @override
  List<Object> get props => [this.error];
}
