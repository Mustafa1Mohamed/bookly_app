import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<String, List<BookModel>>> fetchSearchResult({required String searchWord});
}
