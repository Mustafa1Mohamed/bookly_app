import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_books_state.dart';

class SearchCubitCubit extends Cubit<SearchState> {
  SearchCubitCubit(this.searchRepo) : super(SearchInitialState());
  final SearchRepo searchRepo;
  List<BookModel> resultSearch = [];

  void search(
      {required String searchWord}) async {
    emit(SearchLoadingState());

    if (searchWord.isEmpty) {
      emit(SearchEmptyState());
    } else {
      var data = await searchRepo.fetchSearchResult(
          searchWord: searchWord);
      data.fold(
        (failure) {
          emit(SearchFailureState(errMessage: failure));
        },
        (searchReasult) {
          resultSearch = searchReasult;
          emit(SearchSuccessState(books: searchReasult));
        },
      );
    }
  }
}
