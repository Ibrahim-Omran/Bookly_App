
import 'package:bookly_app/Features/home/presentation/manger/cubits/newset_books/newset_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repos/home_repo.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState>{
  NewsetBooksCubit(this.homeRepo): super(NewsetBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks()async{
    emit(NewsetBooksLoading());
    var result = await homeRepo.fetchNewsetBooks();

    result.fold((failure) {
      emit(NewsetBooksFailure(failure.errMessage));
    }, (books) {
      emit(NewsetBooksSuccess(books));
    });

  }
}