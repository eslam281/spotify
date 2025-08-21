part of 'news_quran_cubit.dart';

@immutable
sealed class NewsQuranState {}

final class NewsQuranInitial extends NewsQuranState {}
final class NewsQuranLoading extends NewsQuranState {}
final class NewsQuranLoaded extends NewsQuranState {
  final List<QuranEntity> quran;

  NewsQuranLoaded({required this.quran});
}
final class NewsQuranLoadFailure extends NewsQuranState {
  final String error;

  NewsQuranLoadFailure({required this.error});
}