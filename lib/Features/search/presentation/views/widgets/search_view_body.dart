import 'package:bookly_app/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: CustomSearchTextField(),
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Best Seller',
            style: Styles.textStyle18,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: SearchResultListView(),
        ),
      ],
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text('hello') //BookListViewItem(),
            );
      },
      itemCount: 10,
    );
    ;
  }
}
