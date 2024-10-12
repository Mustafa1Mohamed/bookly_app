part of 'search_books_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitialState extends SearchState {}

final class SearchSuccessState extends SearchState {
  final List<BookModel> books;

  const SearchSuccessState({required this.books});
}

final class SearchLoadingState extends SearchState {}

final class SearchFailureState extends SearchState {
  final String errMessage;

  const SearchFailureState({required this.errMessage});
}
class SearchEmptyState extends  SearchState{}
