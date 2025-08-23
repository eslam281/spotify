import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';
import '../../repository/quran/quran.dart';

class IsFavoriteQuranUseCase implements UseCase<bool,String>{
  @override
  Future<bool> call({ String? params}) async{
    return await sl<QuranRepository>().isFavoriteQuran(params!);
  }

}