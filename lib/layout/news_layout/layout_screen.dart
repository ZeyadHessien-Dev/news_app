import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/modules/search/search_screen.dart';
import 'package:news_application/shared/components/components.dart';
import 'package:news_application/shared/main_cubit/cubit.dart';
import 'cubit_layout/cubit.dart';
import 'cubit_layout/states.dart';

class NewsLayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsLayoutCubit, NewsLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsLayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: () {
                  MainCubit.get(context).changeTheme();
                },
                icon: const Icon(
                  Icons.dark_mode,
                ),
              ),
            ],
          ),
          body: cubit.screen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavigator(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.business_center_outlined,
                ),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.sports_outlined,
                ),
                label: 'Sport',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.science_outlined,
                ),
                label: 'Science',
              ),
            ],
          ),
        );
      },
    );
  }
}
