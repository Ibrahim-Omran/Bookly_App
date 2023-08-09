import 'package:flutter/material.dart';
import '../../../data/models/book_model.dart';
import 'custom_widget/books_details_section.dart';
import 'custom_widget/custom_book_details_app_bar.dart';
import 'custom_widget/similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.bookModel}) : super(key: key);

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {

    // بحدد عرض الاسكرينة
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children:   [
                const CustomBookDetailsAppBar(),
                BookDetailsSection(
                  bookModel: bookModel,
                ),
                // عشان لو حجم الشاشة كبير يحافظ علي شكلها
                const Expanded(
                  child: SizedBox(height: 50,),
                ),
                const SimilarBooksSection(),
                const SizedBox(height: 40,),


              ],
            ),
          ),
        ),
      ],
    );
  }
}










