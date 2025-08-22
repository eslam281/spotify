import 'package:dartz/dartz.dart';

import '../../../domain/repository/quran/quran.dart';
import '../../../service_locator.dart';
import '../../sources/quran/quran_firebase_service.dart';

class QuranRepositoryImpl extends QuranRepository{
  @override
  Future<Either> getNewsQuran() async{
    return await sl<QuranFirebaseService>().getQuran();
  }

  @override
  Future<Either> getPlayList() async{
    return await sl<QuranFirebaseService>().getPlayList();
  }

  @override
  Future<Either> addOrRemoveFavoriteQuran(String quranId) async{
    return await sl<QuranFirebaseService>().addOrRemoveFavoriteQuran(quranId);
  }

  @override
  Future<bool> isFavoriteQuran(String quranId)async {
    return await sl<QuranFirebaseService>().isFavoriteQuran(quranId);
  }
}