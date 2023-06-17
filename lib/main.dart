import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/network/helper/dio_helper.dart';
import 'package:news_app/screens/layout.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getSports()..getScience()..getTech(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LayoutScreen(),
      ),
    );
  }
}
