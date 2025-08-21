part of 'play_list_cubit.dart';

@immutable
sealed class PlayListState {}

final class PlayListInitial extends PlayListState {}

final class PlayListLoading extends PlayListState {}
final class PlayListLoaded extends PlayListState {
  final List<QuranEntity> quran;

  PlayListLoaded({required this.quran});
}
final class PlayListLoadFailure extends PlayListState {
  final String error;

  PlayListLoadFailure({required this.error});
}