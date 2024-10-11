part of 'search_books_cubit.dart';

sealed class SearchCubitState extends Equatable {
  const SearchCubitState();

  @override
  List<Object> get props => [];
}

final class SearchCubitInitial extends SearchCubitState {}

final class SearchCubSuccess extends SearchCubitState {
  final BookModel bookModel;

  const SearchCubSuccess(this.bookModel);
}

final class SearchCubLoading extends SearchCubitState {}

final class SearchCubFailure extends SearchCubitState {
  final String errMessage;

  const SearchCubFailure(this.errMessage);
}
