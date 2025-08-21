import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify/domain/entities/quran/quran.dart';

import '../../../domain/usecases/quran/get_news_quran.dart';
import '../../../service_locator.dart';

part 'news_quran_state.dart';

class NewsQuranCubit extends Cubit<NewsQuranState> {
  NewsQuranCubit() : super(NewsQuranLoading());

  Future<void> getNewsQuran() async{
    var reurnedSongs = await sl<GetNewsQuranUseCase>().call();
    reurnedSongs.fold((l) {
      emit(NewsQuranLoadFailure(error:l.toString()));
    }, (r) {
      emit(NewsQuranLoaded(quran: r));
    });
  }
}
