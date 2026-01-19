part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class HomeInitialEvent extends HomeBlocEvent{}

class HomeproductWishlistButtonClickedEvent extends HomeBlocEvent{
  final ProductDataModel clickedProduct;

  HomeproductWishlistButtonClickedEvent({required this.clickedProduct});

}
class HomeproductCartButtonClickedEvent extends HomeBlocEvent{
  final ProductDataModel clickedProduct;

  HomeproductCartButtonClickedEvent({required this.clickedProduct});
}
class HomeWishlistButtonNavigateEvent extends HomeBlocEvent{

}
class HomeCartButtonNavigateEvent extends HomeBlocEvent{

}

