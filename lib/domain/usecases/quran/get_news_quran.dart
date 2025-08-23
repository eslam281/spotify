import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';
import '../../repository/quran/quran.dart';

class GetNewsQuranUseCase implements UseCase<Either,dynamic>{
  @override
  Future<Either> call({ params}) {
    return sl<QuranRepository>().getNewsQuran();
  }

}