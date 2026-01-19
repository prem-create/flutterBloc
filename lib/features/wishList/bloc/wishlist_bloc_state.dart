part of 'wishlist_bloc_bloc.dart';

@immutable
sealed class WishlistBlocState {}

abstract class WishlistBlocActionState extends WishlistBlocState {}

final class WishlistBlocInitial extends WishlistBlocState {}

final class WishlistSuccessState extends WishlistBlocState{
  final List<ProductDataModel> wishlistItems ;

  WishlistSuccessState({required this.wishlistItems});
}
