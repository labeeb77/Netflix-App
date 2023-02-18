import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/main_failiure/main_failures.dart';
import 'package:netflix/domain/search/model/search_rep/search_rep.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchRep>> searchMovies({
    required String movieQuery,
  });
}
