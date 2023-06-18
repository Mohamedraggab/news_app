import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/helper/dio_helper.dart';
import 'package:news_app/screens/business.dart';
import 'package:news_app/screens/science.dart';
import 'package:news_app/screens/sports.dart';
import 'package:news_app/screens/tech.dart';


class AppCubit extends Cubit<AppState>
{
  AppCubit() : super(InitState());

  static AppCubit get(context) => BlocProvider.of(context);


  int cIndex = 0 ;
  changeIndex(index)
  {
    cIndex = index ;
    emit(ChangeIndexState());
  }



  var screens = const [
    SportsScreen(),
    TechScreen(),
    ScienceScreen(),
    BusinessScreen(),
  ];

  var titles = const [
    Text('Sports News'),
    Text('Tech News'),
    Text('Science News'),
    Text('Business News'),
  ];


  List<dynamic> sport = [];
  List<dynamic> science = [] ;
  List<dynamic> tech = [] ;
  List<dynamic> business = [] ;


  getSports()
  {
    emit(GetSportState());
    DioHelper.getDate(
        path: 'top-headlines',
        query: {
          'country':'eg',
          'category':'sports',
          'apiKey':'4ca5582741d3481f8c715c5655623356',

        })
        .then((value){
          sport = value.data['articles'];
          emit(GetSportSuccessState());
    })
        .catchError((error){
          print('the error is ${error.toString()}');
      emit(GetSportErrorState());
    });
  }



  getScience()
  {
    emit(GetScienceState());
    DioHelper.getDate(
        path: 'top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apiKey':'4ca5582741d3481f8c715c5655623356',
        })
        .then((value){
          science = value.data['articles'];
          print('/////////////////////////////////////////////////');
          emit(GetScienceSuccessState());

    }).catchError((error){
      print('the error is ${error.toString()}');
      emit(GetScienceErrorState());
    });
  }

  getTech()
  {
    emit(GetTechState());
    DioHelper.getDate(
        path: 'top-headlines',
        query: {
          'country':'eg',
          'category':'technology',
          'apiKey':'4ca5582741d3481f8c715c5655623356',
        })
        .then((value){
          tech = value.data['articles'];
          emit(GetTechSuccessState());
    }).catchError((error){
      print('the error is ${error.toString()}');
      emit(GetTechErrorState());
    });
  }


  getBusiness()
  {
    emit(GetBusinessState());
    DioHelper.getDate(
        path: 'top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'4ca5582741d3481f8c715c5655623356',
        })
        .then((value){
      business = value.data['articles'];
      emit(GetBusinessSuccessState());
    }).catchError((error){
      print('the error is ${error.toString()}');
      emit(GetBusinessErrorState());
    });
  }




  List<dynamic> searchList = [] ;
  search({required String text})
  {
    emit(SearchLoadingState());
    searchList = [] ;
    DioHelper.getDate(
        path: 'top-headlines',
        query: {
          'q':'$text',
          'apiKey':'4ca5582741d3481f8c715c5655623356',
        })
        .then((value){
      searchList = value.data['articles'];
      emit(SearchSuccessState());

    }).catchError((error){
      print('the error is ${error.toString()}');
      emit(SearchErrorState());

    });
  }










}