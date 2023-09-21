import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            itemImage(),
            const SizedBox(
              width: 20,
            ),
            itemDetails(context)
          ],
        ),
      ),
    );
  }

  Expanded itemDetails(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              bookModel.volumeInfo!.title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle20.copyWith(fontFamily: KGtSectraFine),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            bookModel.volumeInfo!.authors?[0],
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle14.copyWith(color: Colors.grey.shade400),
          ),
          const SizedBox(
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Text(
                  "Free",
                  style:
                      Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  " ",
                  style:
                      Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 1,
                ),
                const BookRating(
                  rating: 20,
                  count: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  AspectRatio itemImage() {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: bookModel.volumeInfo!.imageLinks.thumbnail,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
