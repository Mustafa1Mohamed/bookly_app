import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentaion/views/widgets/book_rating.dart';
import 'package:bookly_app/Features/home/presentaion/views/widgets/books_action.dart';
import 'package:bookly_app/Features/home/presentaion/views/widgets/custom_book_item.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetatilsSection extends StatelessWidget {
  const BookDetatilsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .17),
          child: CustomBookImage(
            imageURL: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          bookModel.volumeInfo.title!,
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          bookModel.volumeInfo.authors?[0] ?? '',
          style: Styles.textStyle18.copyWith(
              color: const Color(0xff707070), fontStyle: FontStyle.italic),
        ),
        const SizedBox(
          height: 10,
        ),
        BookRating(
          rating: bookModel.volumeInfo.averageRating ?? 0,
          count: bookModel.volumeInfo.ratingsCount ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 30,
        ),
         BooksAction(bookModel: bookModel,),
      ],
    );
  }
}
