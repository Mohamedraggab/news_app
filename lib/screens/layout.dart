import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/screens/search.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0.0,
            title: AppCubit.get(context).titles[AppCubit.get(context).cIndex],
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(onPressed: ()
            {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen(),));
            }, icon:const Icon(Icons.search)),
              ),
            ],
          ),
          body: AppCubit.get(context).screens[AppCubit.get(context).cIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,

            currentIndex: AppCubit.get(context).cIndex,
            onTap: (value) {
              AppCubit.get(context).changeIndex(value);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.sports_soccer) , label: 'Sports'),
              BottomNavigationBarItem(icon: Icon(Icons.smart_toy_outlined) , label: 'Tech'),
              BottomNavigationBarItem(icon: Icon(Icons.science_outlined) , label: 'Sciences'),
              BottomNavigationBarItem(icon: Icon(Icons.business) , label: 'Business'),
            ],
          ),
        );
      },

    );
  }
}
