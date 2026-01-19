part of 'wishlist_bloc_bloc.dart';

@immutable
sealed class WishlistBlocEvent {}

class WishlistInitialEvent extends WishlistBlocEvent {}

class WishlistItemRemovedEvent extends WishlistBlocEvent {
  final ProductDataModel clickedProduct ;

  WishlistItemRemovedEvent({required this.clickedProduct});
}
