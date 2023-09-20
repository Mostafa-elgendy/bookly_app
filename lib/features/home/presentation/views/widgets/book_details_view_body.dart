import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomBookDetailsAppBar(),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.25, right: width * 0.15),
                child: const CustomBookListViewItem(),
              ),
              Text(
                "The Jungle Book",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Rudyard Kiplling",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle20.copyWith(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              const BookRating(),
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: BooksAction(),
              ),
              const SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("You can also like",
                    textAlign: TextAlign.left,
                    style: Styles.textStyle14
                        .copyWith(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 10,
              ),
              const SimilarBooksListView(),
            ],
          ),
        )
      ],
    );
  }
}
