part of 'favorite_quran_cubit.dart';

@immutable
sealed class FavoriteQuranState {}

final class FavoriteQuranInitial extends FavoriteQuranState {}
final class FavoriteQuranLoading extends FavoriteQuranState {}
final class FavoriteQuranLoaded extends FavoriteQuranState {
  final List<QuranEntity> favoriteQuran;

  FavoriteQuranLoaded({required this.favoriteQuran});
}
final class FavoriteQuranFailure extends FavoriteQuranState {
  final String message;

  FavoriteQuranFailure({required this.message});

}
