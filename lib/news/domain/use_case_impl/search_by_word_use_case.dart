import 'package:equatable/equatable.dart';
import 'package:news_app/core/use_case/use_case.dart';
import 'package:news_app/core/utils/import_files.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/news/domain/entity/news.dart';
import 'package:news_app/news/domain/repository/news_repository.dart';

class GetSearchNewsByWordUseCase extends UseCase<List<News>, SearchParameters> {
  final NewsRepository newsRepository;

  GetSearchNewsByWordUseCase({required this.newsRepository});

  @override
  Future<Either<Failure, List<News>>> call(SearchParameters parameters) async {
    return await newsRepository.getSearchNewsByWord(parameters);
  }
}

class SearchParameters extends Equatable {
  final String searchWord;

  const SearchParameters({required this.searchWord});

  @override
  List<Object> get props => [searchWord];
}
