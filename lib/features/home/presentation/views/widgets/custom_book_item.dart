import 'package:bookly_app/core/utils/app_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookListViewItem extends StatelessWidget {
  const CustomBookListViewItem({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) {
                return const Icon(
                  Icons.error_outline_rounded,
                  size: 50,
                  color: Colors.red,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

/*
Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsPage(movie: movies[index])),
                );
              },
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(15),
                child: Image.network(movies[index].posterPath),
              ),
            ),

*/
