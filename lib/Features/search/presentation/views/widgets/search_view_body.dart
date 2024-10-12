import 'package:bookly_app/Features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/custom_search_result_list_view.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/shimmer_best_seller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubitCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoadingState) {
          return _buildBody(context, const ShimmerBestSeller());
        } else if (state is SearchSuccessState) {
          return _buildBody(context, const SearchResultListView());
        } else if (state is SearchFailureState) {
          return _buildBody(
              context, CustomErrorWidget(errMessage: state.errMessage));
        } else {
          return _buildBody(context, Container()); // Default state
        }
      },
    );
  }

  Padding _buildBody(BuildContext context, Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                BlocProvider.of<SearchCubitCubit>(context)
                    .search(searchWord: value);
              }
            },
            decoration: InputDecoration(
              enabledBorder: buildOutlineInputBorder(),
              focusedBorder: buildOutlineInputBorder(),
              hintText: 'Search',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Opacity(
                  opacity: .8,
                  child: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 22,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Search Result',
            style: Styles.textStyle18,
          ),
          const SizedBox(height: 16),
          Expanded(child: child),
        ],
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
