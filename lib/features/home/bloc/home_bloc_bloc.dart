import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

// this bloc folder is going to have all kind of event which will tell what to do when this event is called 

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    // below sentece means that on HomeproductWishlistButtonClickedEvent called call this homeproductWishlistButtonClickedEvent function
    on<HomeproductWishlistButtonClickedEvent>(
      homeproductWishlistButtonClickedEvent,
    );
    on<HomeproductCartButtonClickedEvent>(homeproductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }
  //and here is function defined for the HomeproductWishlistButtonClickedEvent
  FutureOr<void> homeproductWishlistButtonClickedEvent(
    HomeproductWishlistButtonClickedEvent event,
    Emitter<HomeBlocState> emit,
  ) {
    print('product wishlist Clicked');
  }

  FutureOr<void> homeproductCartButtonClickedEvent(
    HomeproductCartButtonClickedEvent event,
    Emitter<HomeBlocState> emit,
  ) {
    print('product Cart Clicked');
  }

  FutureOr<void> homeCartButtonNavigateEvent(
    HomeCartButtonNavigateEvent event,
    Emitter<HomeBlocState> emit,
  ) {
    print('cart navigate clicked');
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
    HomeWishlistButtonNavigateEvent event,
    Emitter<HomeBlocState> emit,
  ) {
    print('Wishlist navigate clicked');
  }
}
