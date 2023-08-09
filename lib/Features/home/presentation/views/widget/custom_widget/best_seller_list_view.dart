
import 'package:bookly_app/Features/home/presentation/manger/cubits/newset_books/newset_cubit.dart';
import 'package:bookly_app/Features/home/presentation/manger/cubits/newset_books/newset_state.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit,NewsetBooksState>(
      builder: (context,state) {
        if(state is NewsetBooksSuccess){
          return ListView.builder(

            // مش عوزك تسكرول عشان هنسكرور من فوق من CustomScrollView
              physics: const NeverScrollableScrollPhysics(),
              //*****************************************************
              // عوزك تاخد ارتفاع الايتم اللي عندك
              // كدا بخليها تبني كل الويدجت اللي جوها عشان اقدر احدد ارفعها
              // كنا هنستخدمها لو ما استخدمناش SliverFillRemaining
              // shrinkWrap: true,
              //*******************************************************
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context,index){
                return  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BookListViewItem(
                    bookModel: state.books[index],
                  ),
                );
              }
          );

        }else if(state is NewsetBooksFailure){
          return CustomErrorWidget(errMessage: state.errMessage);

        }else{
          return const CustomLoadingIndicator();
        }

      }
    );
  }
}
