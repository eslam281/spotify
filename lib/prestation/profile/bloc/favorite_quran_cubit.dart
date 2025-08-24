import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/quran/quran.dart';
import '../../../domain/usecases/quran/get_favorite_quran.dart';
import '../../../service_locator.dart';

part 'favorite_quran_state.dart';

class FavoriteQuranCubit extends Cubit<FavoriteQuranState> {
  FavoriteQuranCubit() : super(FavoriteQuranLoading());

  List<QuranEntity> favoriteQuran =[];
  Future<void> getFavoriteQuran() async{
    var result = await sl<GetFavoriteQuranUseCase>().call();
    result.fold(
      (l) => emit(FavoriteQuranFailure(message: l.toString())),
      (r) {
        favoriteQuran = r;
        emit(FavoriteQuranLoaded(favoriteQuran: r));
      }
    );
  }
}
