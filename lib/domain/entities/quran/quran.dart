import 'package:cloud_firestore/cloud_firestore.dart';

class QuranEntity {
  final String title;
  final String reader;
  final num duration;
  final Timestamp releaseDate;

  QuranEntity({
    required this.title,
    required this.reader,
    required this.duration,
    required this.releaseDate,
  });
}
