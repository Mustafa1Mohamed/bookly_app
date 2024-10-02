import 'package:bookly_app/Features/home/presentaion/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/Features/home/presentaion/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/home/presentaion/views/widgets/featured_list_view.dart';

import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: FeaturedBooksListView(),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'BestSeller',
            style: Styles.textStyle18,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        BestSellerListViewItem(),
      ],
    );
  }
}
