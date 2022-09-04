import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/layout/news_layout/cubit_layout/cubit.dart';
import 'package:news_application/shared/bloc_observer.dart';
import 'package:news_application/shared/main_cubit/cubit.dart';
import 'package:news_application/shared/main_cubit/states.dart';
import 'package:news_application/shared/network/local/cache_helper.dart';
import 'package:news_application/shared/network/remote/dio_helper.dart';
import 'package:news_application/shared/style/theme.dart';
import 'layout/news_layout/layout_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolData(key: 'isDark');
  runApp(MyApp(isDark!));
}

class MyApp extends StatelessWidget {
  bool isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsLayoutCubit()..getBusiness()),
        BlocProvider(
          create: (context) => MainCubit()..changeTheme(
            isShow: isDark,
          ),
        ),
      ],
      child: BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return MaterialApp(
            theme: cubit.themeData,
            debugShowCheckedModeBanner: false,
            home: NewsLayoutScreen(),
          );
        },
      ),
    );
  }
}
