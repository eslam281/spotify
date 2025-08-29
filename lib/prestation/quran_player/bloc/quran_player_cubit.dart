import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';

import '../../../core/configs/constants/app_urls.dart';
import '../../../domain/entities/quran/quran.dart';

part 'quran_player_state.dart';

class QuranPlayerCubit extends Cubit<QuranPlayerState> {
  final AudioPlayer audioPlayer = AudioPlayer();
  Duration quranDuration = Duration.zero;
  Duration quranPosition = Duration.zero;
  int loopMode = 0;
  int index;
  List<QuranEntity> quranEntity;
  bool isRandom = false;

  StreamSubscription<Duration>? _positionSub;
  StreamSubscription<Duration?>? _durationSub;

  QuranPlayerCubit(this.index, this.quranEntity) : super(QuranPlayerLoading()) {
    _positionSub = audioPlayer.positionStream.listen((position) {
      quranPosition = position;
      updateQuranPlayer();
    });

    _durationSub = audioPlayer.durationStream.listen((duration) {
      if (duration != null) {
        quranDuration = duration;
      }
    });
    audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        nextOrBackQuran(true);
      }
    });
  }

  void updateQuranPlayer() {
    if (!isClosed) {
      emit(QuranPlayerLoaded());
    }
  }

  Future<void> loadQuran() async {
    try {
      await audioPlayer.setUrl(
          "${AppURLs.quran}${quranEntity[index].title}_quran.mp3");
      if (!isClosed) emit(QuranPlayerLoaded());
    } catch (e) {
      if (!isClosed) emit(QuranPlayerFailure(message: e.toString()));
    }
  }

  Future<void> playOrPauseQuran() async {
    if (!audioPlayer.playing) {
      await audioPlayer.play();
    } else {
      await audioPlayer.pause();
    }
    if (!isClosed) emit(QuranPlayerLoaded());
  }

  Future<void> loopOrNotQuran() async {
    if (audioPlayer.loopMode == LoopMode.off) {
      await audioPlayer.setLoopMode(LoopMode.one);
      loopMode = 1;
    } else if (audioPlayer.loopMode == LoopMode.one) {
      await audioPlayer.setLoopMode(LoopMode.all);
      loopMode = 2;
    } else {
      await audioPlayer.setLoopMode(LoopMode.off);
      loopMode = 0;
    }
    if (!isClosed) emit(QuranPlayerLoaded());
  }

  Future<void> nextOrBackQuran(bool isNext) async {
    if (index < quranEntity.length - 1 && isNext) {
      index++;
      loadQuran();
    } else if (index > 0 && !isNext) {
      index--;
      loadQuran();
    }
  }

  @override
  Future<void> close() {
    _positionSub?.cancel();
    _durationSub?.cancel();
    audioPlayer.dispose();
    return super.close();
  }
}
