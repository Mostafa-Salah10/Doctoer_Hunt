part of 'favourite_cubit.dart';

class FavouriteState {
  final BoxState<String> getFavourites;
  final BoxState<List<DoctorEntity>> getFavouritesDoctors;
  final BoxState<String> addOrRemoveFromFav;

  FavouriteState({
    required this.getFavourites,
    required this.addOrRemoveFromFav,

    required this.getFavouritesDoctors,
  });

  FavouriteState.init()
    : this(
        addOrRemoveFromFav: BoxState.initial(),
        getFavourites: BoxState.initial(),
        getFavouritesDoctors: BoxState.initial(),
      );

  FavouriteState copyWith({
    BoxState<String>? getFavourites,
    BoxState<String>? addOrRemoveFromFav,
    BoxState<List<DoctorEntity>>? getFavouritesDoctors,
  }) {
    return FavouriteState(
      getFavouritesDoctors: getFavouritesDoctors ?? this.getFavouritesDoctors,
      addOrRemoveFromFav: addOrRemoveFromFav ?? this.addOrRemoveFromFav,
      getFavourites: getFavourites ?? this.getFavourites,
    );
  }
}
