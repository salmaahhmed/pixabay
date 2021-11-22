part of 'combined_bloc.dart';

abstract class GetCombinedEventBase extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCombinedEvent extends GetCombinedEventBase {
  final String state;
  final String category;
  final String sort;
  final int page = 1;
  GetCombinedEvent(this.state, this.sort, this.category, {page});

  @override
  List<Object> get props => [this.state, this.sort, this.page];
}

class LoadMoreCombined extends GetCombinedEventBase {}

