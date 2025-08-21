import 'package:dartz/dartz.dart';
import 'package:spotify/data/repository/quran/quran_repository_imp.dart';

import '../../../core/usecase/usecase.dart';
import '../../../data/models/auth/create_user_req.dart';
import '../../../service_locator.dart';
import '../../repository/auth/auth.dart';
import '../../repository/quran/quran.dart';

class GetNewsQuranUseCase implements UseCase<Either,dynamic>{
  @override
  Future<Either> call({ param}) {
    return sl<QuranRepository>().getNewsQuran();
  }

}