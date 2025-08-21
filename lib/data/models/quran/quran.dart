import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/quran/quran.dart';

class QuranModel {
  final String title;
  final String artist;
  final num duration;
  final Timestamp releaseDate;

  QuranModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
  });
  factory QuranModel.fromJson(Map<String, dynamic> json) {
    return QuranModel(
      title: json['title'],
      artist: json['artist'],
      duration: json['duration'],
      releaseDate: json['releaseDate'],
    );
  }
}

extension QuranModelX on QuranModel {
  QuranEntity toEntity() {
    return QuranEntity(
      title: title,
      artist: artist,
      duration: duration,
      releaseDate: releaseDate,
    );

  }
}