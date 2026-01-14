import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/features/home/bloc/home_bloc_bloc.dart';

//only the Ui will be here 

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //HomeBloc instance 
    final HomeBlocBloc homeBloc = HomeBlocBloc();
    //telling the app that bloc is used by rapping the body with **BlocConsumer**
    return BlocConsumer<HomeBlocBloc, HomeBlocState>(
      //providing bloc instance to the named parameter bloc
      bloc: homeBloc,
      // listenWhen: (Previous, current) {null;},
      // buildWhen: (Previous, current) {null;},
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            animateColor: true,
            backgroundColor: Colors.teal,
            title: Text('Prem Grocery App'),
            actions: [
              IconButton(
                onPressed: () {
                  // adding a event on press of button which will later trigger an action that will navigate to separate page 
                  homeBloc.add(HomeWishlistButtonNavigateEvent());
                },
                icon: Icon(Icons.favorite),
              ),
              IconButton(
                onPressed: () {
                  homeBloc.add(HomeCartButtonNavigateEvent());
                },
                icon: Icon(Icons.shopping_bag),
              ),
            ],
          ),
        );
      },
    );
  }
}
