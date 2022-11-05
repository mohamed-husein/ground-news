import 'package:news_app/core/error/failure.dart';
import 'package:news_app/news/domain/entity/breaking_news.dart';
import 'package:news_app/news/domain/entity/news.dart';
import 'package:news_app/core/utils/import_files.dart';
import 'package:news_app/news/domain/use_case_impl/search_by_word_use_case.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<News>>> getSportsNews();

  Future<Either<Failure, List<News>>> getHealthNews();

  Future<Either<Failure, List<News>>> getScienceNews();

  Future<Either<Failure, List<News>>> getBusinessNews();

  Future<Either<Failure, List<News>>> getSearchNewsByWord(
      SearchParameters parameters);

  Future<Either<Failure, List<BreakingNews>>> getBreakingNews();
}
