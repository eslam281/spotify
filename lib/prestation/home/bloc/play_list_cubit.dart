import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/quran/quran.dart';
import '../../../domain/usecases/quran/get_play_list.dart';
import '../../../service_locator.dart';

part 'play_list_state.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListInitial());
  Future<void> getPlayList() async{
    var reurnedSongs = await sl<GetPlayListUseCase>().call();
    reurnedSongs.fold((l) {
      emit(PlayListLoadFailure(error:l.toString()));
    }, (r) {
      emit(PlayListLoaded(quran: r));
    });
  }
}
