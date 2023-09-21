import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final HomeRepo homeRepo;
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  Future<void> fetchFeatureBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.message));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
