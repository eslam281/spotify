import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/domain/repository/quran/quran.dart';
import 'package:spotify/domain/usecases/auth/get_user.dart';

import 'data/repository/quran/quran_repository_imp.dart';
import 'data/sources/quran/quran_firebase_service.dart';
import 'domain/repository/auth/auth.dart';
import 'domain/usecases/auth/signin.dart';
import 'domain/usecases/auth/signup.dart';
import 'domain/usecases/quran/add_or_remove_favorite_quran.dart';
import 'domain/usecases/quran/get_news_quran.dart';
import 'domain/usecases/quran/get_play_list.dart';
import 'domain/usecases/quran/is_favorite_quran.dart';

final sl =GetIt.instance;

Future<void> initializeDependencies() async {

  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );
  sl.registerSingleton<QuranFirebaseService>(
      QuranFirebaseServiceImpl()
  );
  //////////////////////

  sl.registerSingleton<AuthRepository>(
      AuthRepositoryImpl()
  );
  sl.registerSingleton<QuranRepository>(
      QuranRepositoryImpl()
  );

  ///////////////////
  sl.registerSingleton<SignUpUseCase>(
      SignUpUseCase()
  );
  sl.registerSingleton<SignInUseCase>(
      SignInUseCase()
  );
  sl.registerSingleton<GetNewsQuranUseCase>(
      GetNewsQuranUseCase()
  );
  sl.registerSingleton<GetPlayListUseCase>(
      GetPlayListUseCase()
  );
 sl.registerSingleton<AddOrRemoveFavoriteQuranUseCase>(
     AddOrRemoveFavoriteQuranUseCase()
  );
 sl.registerSingleton<IsFavoriteQuranUseCase>(
     IsFavoriteQuranUseCase()
  );
  sl.registerSingleton<GetUserUseCase>(
      GetUserUseCase()
  );

}