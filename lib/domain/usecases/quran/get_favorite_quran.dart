import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';
import '../../repository/quran/quran.dart';

class GetFavoriteQuranUseCase implements UseCase<Either,String>{
  @override
  Future<Either> call({ String? params}) async{
    return await sl<QuranRepository>().getUserFavoriteQuran();
  }

}