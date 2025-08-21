import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/entities/quran/quran.dart';
import '../../models/quran/quran.dart';

abstract class QuranFirebaseService{
  Future<Either> getQuran();

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
        quran.add(QuranModel.fromJson(element.data()).toEntity());
      }
      return Right(quran);
    }catch(e) {
      return const Left("An error occurred, please try again .");
    }
  }
}
