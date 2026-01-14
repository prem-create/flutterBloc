import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/features/cart/UI/cart.dart';
import 'package:flutter_bloc_app/features/home/UI/product_tile_widget.dart';
import 'package:flutter_bloc_app/features/home/bloc/home_bloc_bloc.dart';
import 'package:flutter_bloc_app/features/wishList/UI/wishlist.dart';

//only the Ui will be here

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //HomeBloc instance
  final HomeBlocBloc homeBloc = HomeBlocBloc();
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //telling the app that bloc is used by rapping the body with **BlocConsumer**
    return BlocConsumer<HomeBlocBloc, HomeBlocState>(
      //providing bloc instance to the named parameter bloc
      bloc: homeBloc,
      listenWhen: (Previous, current) => current is HomeActionState,
      buildWhen: (Previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageACtionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cart()),
          );
        } else if (state is HomeNavigateToWishlistPageACtionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Wishlist()),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(body: Center(child: CircularProgressIndicator()));

          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
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
                    icon: Icon(Icons.favorite_outline),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                    productDataModel: successState.products[index],
                  );
                },
              ),
            );

          case HomeErrorState:
            return Scaffold(body: Center(child: Text('Error')));

          default:
            return SizedBox();
        }
      },
    );
  }
}
