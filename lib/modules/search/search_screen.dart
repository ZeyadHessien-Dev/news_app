import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/layout/news_layout/cubit_layout/cubit.dart';
import 'package:news_application/layout/news_layout/cubit_layout/states.dart';
import 'package:news_application/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsLayoutCubit, NewsLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsLayoutCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                defaultTextForm(
                  controller: searchController,
                  labelText: 'Search',
                  prefixIcon: Icons.search,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    NewsLayoutCubit.get(context).getSearch(value: value);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: buildListItem(
                    context,
                    cubit,
                    isSearch: false,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
