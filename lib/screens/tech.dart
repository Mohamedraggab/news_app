import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/webview.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../shared/shared_material.dart';

class TechScreen extends StatelessWidget {
  const TechScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var dataList = AppCubit.get(context).tech;
    return BlocConsumer<AppCubit , AppState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: dataList.isNotEmpty,
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
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}


