import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/layout/news_layout/cubit_layout/states.dart';
import 'package:news_application/modules/business/business_screen.dart';
import 'package:news_application/modules/science/science_screen.dart';
import 'package:news_application/modules/sport/sport_screen.dart';
import 'package:news_application/shared/network/remote/dio_helper.dart';

class NewsLayoutCubit extends Cubit<NewsLayoutStates> {
  NewsLayoutCubit() : super(InitialNewsLayoutState());

  static NewsLayoutCubit get(context) => BlocProvider.of(context);

  // Basics
  List<Widget> screen = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];
  List<String> titles = [
    'Business',
    'Sport',
    'Science',
  ];
  int currentIndex = 0;

  void changeBottomNavigator(index) {
    if (index == 1 && sport.isEmpty) {
      getSport();
    }
    if (index == 2 && science.isEmpty) {
      getScience();
    }
    currentIndex = index;
    emit(ChangeBottomNavigatorState());
  }


  // APIS

  // 1. Business
  List<dynamic> business = [];
  void getBusiness() {
    emit(LoadingBusinessNewsLayoutState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country' : 'us',
        'category' : 'business',
        'apiKey' : '143c6f9fa1964cdabe9887021002e52a',
      },
    ).then((value) {
      print(value.data);
      business = value.data['articles'];
      emit(SuccessBusinessNewsLayoutState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorBusinessNewsLayoutState(error.toString()));
    });
  }

  // 2. Sport
  List<dynamic> sport = [];
  void getSport() {
    emit(LoadingSportNewsLayoutState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country' : 'us',
        'category' : 'sport',
        'apiKey' : '143c6f9fa1964cdabe9887021002e52a',
      },
    ).then((value) {
      sport = value.data['articles'];
      emit(SuccessSportNewsLayoutState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorSportNewsLayoutState(error.toString()));
    });
  }

  // 3. Science
  List<dynamic> science = [];
  void getScience() {
    emit(LoadingScienceNewsLayoutState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country' : 'us',
        'category' : 'science',
        'apiKey' : '143c6f9fa1964cdabe9887021002e52a',
      },
    ).then((value) {
      science = value.data['articles'];
      emit(SuccessScienceNewsLayoutState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorScienceNewsLayoutState(error.toString()));
    });
  }

  // 4. Search
  List<dynamic> search = [];
  void getSearch({required String value}) {
    emit(LoadingSearchNewsLayoutState());
    search = [];
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q' : value,
        'apiKey' : '143c6f9fa1964cdabe9887021002e52a',
      },
    ).then((value) {
      print(value.data);
      search = value.data['articles'];
      emit(SuccessSearchNewsLayoutState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorSearchNewsLayoutState(error.toString()));
    });
  }





}
