import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_app/data/wish_list_items.dart';
import 'package:flutter_bloc_app/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_bloc_event.dart';
part 'wishlist_bloc_state.dart';

class WishlistBlocBloc extends Bloc<WishlistBlocEvent, WishlistBlocState> {
  WishlistBlocBloc() : super(WishlistBlocInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistItemRemovedEvent>(wishlistItemRemoved);
  }

  FutureOr<void> wishlistInitialEvent(
    WishlistInitialEvent event,
    Emitter<WishlistBlocState> emit,
  ) {
    emit(WishlistSuccessState(wishlistItems: wishListItems));
  }

  FutureOr<void> wishlistItemRemoved(
    WishlistItemRemovedEvent event,
    Emitter<WishlistBlocState> emit,
  ) {
    wishListItems.remove(event.clickedProduct);
      print("wishlist items count: ${wishListItems.length}");
    emit(WishlistSuccessState(wishlistItems: wishListItems));
    emit(WishlistItemRemovedActionState());
  }
}
