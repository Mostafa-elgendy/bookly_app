import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

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
              "Harry Potter and the Goblet of Fire",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle20.copyWith(fontFamily: KGtSectraFine),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "J.K Rwoling ",
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
                  "12.99 E",
                  style:
                      Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 1,
                ),
                const BookRating(),
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
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            AssetsData.testImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
