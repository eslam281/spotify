import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/quran/quran.dart';

class QuranModel {
  final String title;
  final String reader;
  final num duration;
  final Timestamp releaseDate;

  QuranModel({
    required this.title,
    required this.reader,
    required this.duration,
    required this.releaseDate,
  });
  factory QuranModel.fromJson(Map<String, dynamic> json) {
    return QuranModel(
      title: json['title'],
      reader: json['reader'],
      duration: json['duration'],
      releaseDate: json['releaseDate'],
    );
  }
}

extension QuranModelX on QuranModel {
  QuranEntity toEntity() {
    return QuranEntity(
      title: title,
      reader: reader,
      duration: duration,
      releaseDate: releaseDate,
    );

  }
}