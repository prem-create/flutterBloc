import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_app/data/grocery_data.dart';
import 'package:flutter_bloc_app/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

// this bloc folder is going to have all kind of event which will tell what to do when this event is called

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);

    // below sentece means that on HomeproductWishlistButtonClickedEvent called call this homeproductWishlistButtonClickedEvent function
    on<HomeproductWishlistButtonClickedEvent>(
      homeproductWishlistButtonClickedEvent,
    );

    on<HomeproductCartButtonClickedEvent>(homeproductCartButtonClickedEvent);

    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);

    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
    HomeInitialEvent event,
    Emitter<HomeBlocState> emit,
  ) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(
      HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map(
              (e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl'],
                quantity: e['quantity'],
              ),
            )
            .toList(),
      ),
    );
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
    //flutter emits ui so here we are emitting a state on HomeCartButtonNavigateEvent
    emit(HomeNavigateToCartPageACtionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
    HomeWishlistButtonNavigateEvent event,
    Emitter<HomeBlocState> emit,
  ) {
    print('Wishlist navigate clicked');
    emit(HomeNavigateToWishlistPageACtionState());
  }
}
