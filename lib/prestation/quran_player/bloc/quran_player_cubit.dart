import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quran_player_state.dart';

class QuranPlayerCubit extends Cubit<QuranPlayerState> {
  QuranPlayerCubit() : super(QuranPlayerInitial());
}
