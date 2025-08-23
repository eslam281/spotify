import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecases/quran/add_or_remove_favorite_quran.dart';
import '../../../service_locator.dart';

part 'favorite_button_state.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  void favoriteButtonUpdated(String quranId) async {
    var result = await sl<AddOrRemoveFavoriteQuranUseCase>().call(
      params: quranId,
    );
    result.fold((l) {}, (r) {
      emit(FavoriteButtonUpdated(isFavorite: r));
    });
  }
}
