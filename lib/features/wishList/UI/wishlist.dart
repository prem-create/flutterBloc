import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/features/wishList/UI/wishlist_tile.dart';
import 'package:flutter_bloc_app/features/wishList/bloc/wishlist_bloc_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBlocBloc wishlistBloc = WishlistBlocBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wishlist page')),
      body: BlocConsumer<WishlistBlocBloc, WishlistBlocState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistBlocActionState,
        buildWhen: (previous, current) => current is! WishlistBlocActionState,
        listener: (context, state) {
          if (state is WishlistItemRemovedActionState) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('item removed'),duration: Duration(seconds: 1),));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return ListView.builder(
                itemCount: successState.wishlistItems.length,
                itemBuilder: (context, index) => WishlistTile(
                  productDataModel: successState.wishlistItems[index],
                  wishlistBloc: wishlistBloc,
                ),
              );
          }
          return Container();
        },
      ),
    );
  }
}
