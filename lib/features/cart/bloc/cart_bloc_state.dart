part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocState {}

abstract class CartActionHomeState extends CartBlocState {}

final class CartBlocInitial extends CartBlocState {}

class CartSuccesState extends CartBlocState {
  final List<ProductDataModel> cartItems;

  CartSuccesState({required this.cartItems});
}

class cartRemovedActionState extends CartActionHomeState{}
