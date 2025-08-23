import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/entities/quran/quran.dart';
import '../../../domain/usecases/quran/is_favorite_quran.dart';
import '../../../service_locator.dart';
import '../../models/quran/quran.dart';

abstract class QuranFirebaseService{
  Future<Either> getQuran();
  Future<Either> getPlayList();
  Future<Either> addOrRemoveFavoriteQuran(String quranId);
  Future<bool> isFavoriteQuran(String quranId);

}

class QuranFirebaseServiceImpl extends QuranFirebaseService{
  @override
  Future<Either> getQuran() async{
    List<QuranEntity> quran =[];
    try{
      var data = await FirebaseFirestore.instance
          .collection('quran')
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();
      for (var element in data.docs) {
        var quranModel = QuranModel.fromJson(element.data());
        bool isFavorite = await sl<IsFavoriteQuranUseCase>().call(params:element.reference.id);
        quranModel.isFavorite = isFavorite;
        quranModel.quranId = element.reference.id;
        quran.add(
            quranModel.toEntity()
        );
      }
      return Right(quran);
    }catch(e) {
      return Left("An error occurred, please try again $e.");
    }
  }

  @override
  Future<Either> getPlayList()async {
    List<QuranEntity> quran =[];
    try{
      var data = await FirebaseFirestore.instance
          .collection('quran')
          .orderBy('releaseDate', descending: true).get();
      for (var element in data.docs) {
        var quranModel = QuranModel.fromJson(element.data());
        bool isFavorite = await sl<IsFavoriteQuranUseCase>().call(params:element.reference.id);
        quranModel.isFavorite = isFavorite;
        quranModel.quranId = element.reference.id;
        quran.add(
            quranModel.toEntity()
        );
      }
      return Right(quran);
    }catch(e) {
      return Left("An error occurred, please try again $e.");
    }
  }

  @override
  Future<Either> addOrRemoveFavoriteQuran(String quranId) async{
    try{
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

      var user = firebaseAuth.currentUser;
      String uid = user!.uid;
      late bool isFavorite;

      QuerySnapshot favoriteQuran = await firestore
          .collection('Users')
          .doc(uid)
          .collection('Favorite')
          .
      where('QuranId', isEqualTo: quranId)
          .get();
      if (favoriteQuran.docs.isNotEmpty) {
        await favoriteQuran.docs.first.reference.delete();
        isFavorite = false;
      } else {
        await firestore.collection('Users').doc(uid).collection('Favorite').
        add({'QuranId': quranId, 'addedDate': DateTime.now()});
        isFavorite = true;
      }
      return Right(isFavorite);
    }catch(e){
      return Left("An error occurred $e.");
    }
  }

  @override
  Future<bool> isFavoriteQuran(String quranId) async{
    try{
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

      var user = firebaseAuth.currentUser;
      String uid = user!.uid;

      QuerySnapshot favoriteQuran = await firestore
          .collection('Users')
          .doc(uid)
          .collection('Favorite')
          .
      where('QuranId', isEqualTo: quranId)
          .get();
      if (favoriteQuran.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    }catch(e){
      return false;
    }
  }
}
