import 'package:dartz/dartz.dart';

abstract class QuranRepository{
  Future<Either> getNewsQuran();
  Future<Either> getPlayList();

  Future<Either> addOrRemoveFavoriteQuran(String quranId);

  Future<bool> isFavoriteQuran(String quranId);
}