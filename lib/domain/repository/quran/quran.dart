import 'package:dartz/dartz.dart';

abstract class QuranRepository{
  Future<Either> getNewsQuran();
}