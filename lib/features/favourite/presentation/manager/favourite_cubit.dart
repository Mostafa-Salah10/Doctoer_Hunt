import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/helpers/box_state.dart';
import 'package:doctor_hunt/features/favourite/data/repo/fav_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit({required FavRepo favRepo})
    : _favRepo = favRepo,
      super(FavouriteState.init());

  Set<String> favourites = {};

  List<DoctorEntity> allFavourites = [];

  final FavRepo _favRepo;

  Future<void> getFavouritesIds() async {
    emit(state.copyWith(getFavourites: BoxState.loading()));

    final result = await _favRepo.getFavDoctorsIds();

    result.fold(
      (error) {
        emit(state.copyWith(getFavourites: BoxState.error(error: error)));
      },
      (favs) {
        favourites = {...favs};

        emit(state.copyWith(getFavourites: BoxState.success()));
      },
    );
  }

  Future<void> removeFromFavourites({required String doctorId}) async {
    favourites.remove(doctorId);
    emit(state.copyWith(addOrRemoveFromFav: BoxState.loading(data: doctorId)));

    final result = await _favRepo.removeFromFav(doctorId: doctorId);

    result.fold(
      (error) {
        favourites.add(doctorId);
        emit(
          state.copyWith(
            addOrRemoveFromFav: BoxState.error(error: error, data: doctorId),
          ),
        );
      },
      (_) {
        emit(
          state.copyWith(addOrRemoveFromFav: BoxState.success(data: doctorId)),
        );
      },
    );
  }

  Future<void> addToFavourites({required String doctorId}) async {
    favourites.add(doctorId);
    emit(state.copyWith(addOrRemoveFromFav: BoxState.loading(data: doctorId)));

    final result = await _favRepo.addToFav(doctorId: doctorId);

    result.fold(
      (error) {
        favourites.remove(doctorId);
        emit(
          state.copyWith(
            addOrRemoveFromFav: BoxState.error(error: error, data: doctorId),
          ),
        );
      },
      (_) {
        emit(
          state.copyWith(addOrRemoveFromFav: BoxState.success(data: doctorId)),
        );
      },
    );
  }

  Future<void> getFavouritesDoctors() async {
    emit(state.copyWith(getFavouritesDoctors: BoxState.loading()));

    final result = await _favRepo.getFavDoctors();

    result.fold(
      (error) {
        emit(
          state.copyWith(getFavouritesDoctors: BoxState.error(error: error)),
        );
      },
      (doctors) {
        allFavourites = doctors;
        emit(
          state.copyWith(getFavouritesDoctors: BoxState.success(data: doctors)),
        );
      },
    );
  }

  bool isFav({required String doctorId}) {
    return favourites.contains(doctorId);
  }

  void searchForDoctor({required String word}) {
    if (state.getFavouritesDoctors.data == null) {
      return;
    }
    if (word.trim().isEmpty) {
      emit(
        state.copyWith(
          getFavouritesDoctors: BoxState.success(data: allFavourites),
        ),
      );

      return;
    }
    List<DoctorEntity> filteredDoctos = [];
    filteredDoctos = state.getFavouritesDoctors.data!.where((doctor) {
      return doctor.name.toLowerCase().contains(word.toLowerCase());
    }).toList();

    emit(
      state.copyWith(
        getFavouritesDoctors: BoxState.success(data: filteredDoctos),
      ),
    );
  }
}
