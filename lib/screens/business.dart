import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:news_app/screens/webview.dart';

import '../shared/shared_material.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var dataList = AppCubit.get(context).business;
    return BlocConsumer<AppCubit , AppState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! GetScienceState ,
          builder: (context) => ListView.separated(
            physics:const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(dataList[index]['url']),));
                },
                child: buildCard(dataList: dataList, index: index),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 5,),
            itemCount: dataList.length,
          ),
          fallback:(context) => const Center(child: CircularProgressIndicator()) ,
        );
      },
    );
  }
}


