part of 'add_to_wishlist_cubit.dart';

@immutable
sealed class AddToWishlistState {}

final class AddToWishlistInitial extends AddToWishlistState {}

final class AddToWishlistSucces extends AddToWishlistState {}

final class AddToWishlistFail extends AddToWishlistState {
  String error;
  AddToWishlistFail(this.error);
}

final class AddToWishlistLoading extends AddToWishlistState {}
