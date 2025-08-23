import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/quran/quran.dart';

class QuranModel {
   String? title;
   String? reader;
   num? duration;
   Timestamp? releaseDate;
   bool? isFavorite;
   String? quranId;

  QuranModel({
    required this.title,
    required this.reader,
    required this.duration,
    required this.releaseDate,
    required this.isFavorite,
  });
   QuranModel.fromJson(Map<String, dynamic> json) {
      title= json['title'];
      reader= json['reader'];
      duration= json['duration'];
      releaseDate= json['releaseDate'];
  }
}

extension QuranModelX on QuranModel {
  QuranEntity toEntity() {
    return QuranEntity(
      title: title!,
      reader: reader!,
      duration: duration!,
      releaseDate: releaseDate!,
      isFavorite: isFavorite!,
      quranId: quranId!,
    );

  }
}