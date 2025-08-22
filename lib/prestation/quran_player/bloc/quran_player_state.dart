part of 'quran_player_cubit.dart';

@immutable
sealed class QuranPlayerState {}

final class QuranPlayerInitial extends QuranPlayerState {}

final class QuranPlayerLoading extends QuranPlayerState {}
final class QuranPlayerLoaded extends QuranPlayerState {}
final class QuranPlayerFailure extends QuranPlayerState {
  final String message;

  QuranPlayerFailure({required this.message});
}
