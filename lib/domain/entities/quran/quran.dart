import 'package:cloud_firestore/cloud_firestore.dart';

class QuranEntity {
  final String title;
  final String reader;
  final num duration;
  final Timestamp releaseDate;
  final bool isFavorite;
  final String quranId;

  QuranEntity( {
    required this.title,
    required this.reader,
    required this.duration,
    required this.releaseDate,
    required this.isFavorite,
    required this.quranId,
  });
}
