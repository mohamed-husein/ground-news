import 'package:news_app/core/use_case/use_case.dart';
import 'package:news_app/core/utils/import_files.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/news/domain/entity/breaking_news.dart';
import 'package:news_app/news/domain/repository/news_repository.dart';

class GetBreakingNewsUseCase extends UseCase<List<BreakingNews>,NoParameters>{
  final NewsRepository newsRepository;

  GetBreakingNewsUseCase({required this.newsRepository});
  @override
  Future<Either<Failure, List<BreakingNews>>> call(NoParameters parameters) async{
    return await newsRepository.getBreakingNews();
  }
}