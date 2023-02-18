import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/costurl/strings.dart';
import 'package:netflix/presentation/search/scren_search.dart';
import 'package:netflix/presentation/search/widget/search_title.dart';

import '../../../core/size/constsaize.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Top Searches',
        ),
        khight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text("Error while getting data"),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(
                  child: Text("List is Empty"),
                );
              }
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final movie = state.idleList[index];
                  return TopSearchItemTile(
                      imageUrl: '$imageAppendUrl${movie.posterPath}',
                      title: movie.title ?? "No title provided");
                },
                separatorBuilder: (context, index) => khight20,
                itemCount: state.idleList.length,
              );
            },
          ),
        )
      ],
    );
  }
}
