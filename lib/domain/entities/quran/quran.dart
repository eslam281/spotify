import 'package:cloud_firestore/cloud_firestore.dart';

class QuranEntity {
  final String title;
  final String artist;
  final num duration;
  final Timestamp releaseDate;

  QuranEntity({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
  });
}
