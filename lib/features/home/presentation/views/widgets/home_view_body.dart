import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              CustomAppBar(),
              SizedBox(
                height: 10,
              ),
              BooksListView(),
              Text(
                "Newest Books",
                textAlign: TextAlign.start,
                style: Styles.textStyle18,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: BestSellerListView(),
        )
      ],
    );
  }
}
