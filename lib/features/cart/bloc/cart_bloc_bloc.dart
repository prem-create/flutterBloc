import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_app/data/cart_items.dart';
import 'package:flutter_bloc_app/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBlocBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBlocBloc() : super(CartBlocInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
    CartInitialEvent event,
    Emitter<CartBlocState> emit,
  ) {
    emit(CartSuccesState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
    CartRemoveFromCartEvent event,
    Emitter<CartBlocState> emit,
  ) {
    cartItems.remove(event.productDataModel);
      print("cart items count: ${cartItems.length}");
    emit(CartSuccesState(cartItems: cartItems));
    emit(cartRemovedActionState());
  }
}
