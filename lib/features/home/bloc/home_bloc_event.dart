part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class HomeproductWishlistButtonClickedEvent extends HomeBlocEvent{

}
class HomeproductCartButtonClickedEvent extends HomeBlocEvent{

}
class HomeWishlistButtonNavigateEvent extends HomeBlocEvent{

}
class HomeCartButtonNavigateEvent extends HomeBlocEvent{

}

