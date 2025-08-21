import 'package:dartz/dartz.dart';

import '../../../domain/repository/quran/quran.dart';
import '../../../service_locator.dart';
import '../../sources/quran/quran_firebase_service.dart';

class QuranRepositoryImpl extends QuranRepository{
  @override
  Future<Either> getNewsQuran() {
    return sl<QuranFirebaseService>().getQuran();
  }

}