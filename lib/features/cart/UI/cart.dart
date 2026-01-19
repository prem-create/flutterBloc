import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/features/cart/UI/cart_tile_widget.dart';
import 'package:flutter_bloc_app/features/cart/bloc/cart_bloc_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBlocBloc cartBloc = CartBlocBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart Items')),
      body: BlocConsumer<CartBlocBloc, CartBlocState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionHomeState,
        buildWhen: (previous, current) => current is! CartActionHomeState,
        listener: (context, state) {
          switch (state.runtimeType) {
            case cartRemovedActionState:
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('item removed'),
                  duration: Duration(seconds: 1),
                ),
              );
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccesState:
              final successState = state as CartSuccesState;
              return ListView.builder(
                itemCount: successState.cartItems.length,
                itemBuilder: (context, index) {
                  return CartTileWidget(
                    productDataModel: successState.cartItems[index],
                    cartBloc: cartBloc,
                  );
                },
              );
          }
          return Container();
        },
      ),
    );
  }
}
