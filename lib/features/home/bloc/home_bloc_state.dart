part of 'home_bloc_bloc.dart';

/*
## State ##
[Two types- Action State(perform any Action) and simple State(builds Ui)]

  -Simple State 
    ex- Loding while fetching (ui updates when some API fetching is happening in background)
    ex- clicking on a like button will update Ui and do some API call in backend 
    => will extend to state class HomeBlocState(**class ...State**)
  
  -Action State
    ex- clicking on wishlist or Cart button which will trigger a navigation(An Action)
    => will extend to state class HomeActionState(**class ...ActionState**)
 */

@immutable
sealed class HomeBlocState {}

abstract class  HomeActionState extends HomeBlocState{}

final class HomeBlocInitial extends HomeBlocState {}

class HomeLoadingState extends HomeBlocState{}

class HomeLoadedSuccessState extends HomeBlocState{}

class HomeErrorState extends HomeBlocState{}

class HomeNavigateToWishlistPageACtionState extends HomeActionState{}

class HomeNavigateToCartPageACtionState extends HomeActionState{}