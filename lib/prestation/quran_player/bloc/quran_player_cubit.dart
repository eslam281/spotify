import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';

part 'quran_player_state.dart';

class QuranPlayerCubit extends Cubit<QuranPlayerState> {

  AudioPlayer audioPlayer = AudioPlayer();
  Duration quranDuration = Duration.zero;
  Duration quranPosition = Duration.zero;
  int loopMode = 0;
  bool isRandom = false;

  QuranPlayerCubit() : super(QuranPlayerLoading()){
   audioPlayer.positionStream.listen((position) {
     quranPosition = position;
     updateQuranPlayer();
   });
   audioPlayer.durationStream.listen((duration) {
     if (duration != null) {
       quranDuration = duration;
     }
   });
  }

  void updateQuranPlayer(){
    emit(QuranPlayerLoaded());
  }


  Future<void> loadQuran(String url) async {
    try {
      await audioPlayer.setUrl(url);
      emit(QuranPlayerLoaded());
    } catch (e) {
      emit(QuranPlayerFailure(message: e.toString()));
    }
  }

  Future<void> playOrPauseQuran() async {
    if (!audioPlayer.playing) {
      await audioPlayer.play();
    } else {
      await audioPlayer.pause();
    }
    emit(QuranPlayerLoaded());
  }
  Future<void> loopOrNotQuran() async {
    if (audioPlayer.loopMode == LoopMode.off) {
      await audioPlayer.setLoopMode(LoopMode.one);
      loopMode = 1;
    } else if (audioPlayer.loopMode == LoopMode.one) {
      await audioPlayer.setLoopMode(LoopMode.all);
      loopMode = 2;
    }else{
      await audioPlayer.setLoopMode(LoopMode.off);
      loopMode = 0;
    }
    emit(QuranPlayerLoaded());
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
