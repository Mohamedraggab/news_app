import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/screens/webview.dart';

import '../shared/shared_material.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var searchController = TextEditingController();
        var  dataList = AppCubit.get(context).searchList;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: TextFormField(
              keyboardType: TextInputType.text,

              controller: searchController,
                decoration:const InputDecoration(
                    border: InputBorder.none ,
                    hintText: 'Search Here'),
              onEditingComplete: () => AppCubit.get(context).search(text: searchController.text),
            ),
          ),
          body: ConditionalBuilder(
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
            fallback:(context) => const Center(child: CircularProgressIndicator()) ,

          ),
        );
      },
    );
  }
}
