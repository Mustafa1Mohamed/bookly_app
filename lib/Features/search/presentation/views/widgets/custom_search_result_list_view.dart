import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentaion/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/Features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/shimmer_best_seller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubitCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccessState) {
          List<BookModel> searchReasult = state.books;
          if (searchReasult.isEmpty) {
            return const Center(
                child: Text(
              "This Item Not Found ",
              style: Styles.textStyle20,
            ));
          } else {
            return ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: searchReasult.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: BookListViewItem(
                      bookModel: searchReasult[index],
                    ),
                  );
                });
          }
        } else if (state is SearchFailureState) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is SearchLoadingState) {
          return const ShimmerBestSeller();
        } else if (state is SearchEmptyState) {
          return const Center(
              child: Text(
            "Seacrh for item",
            style: Styles.textStyle20,
          ));
        } else {
          return const Center(
              child: Text(
            "Seacrh for item",
            style: Styles.textStyle20,
          ));
        }
      },
    );
  }
}
