import 'package:news_app/core/use_case/use_case.dart';
import 'package:news_app/core/utils/import_files.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/news/domain/entity/news.dart';
import 'package:news_app/news/domain/repository/news_repository.dart';

class GetBusinessNewsUseCase extends UseCase<List<News>,NoParameters>{
  final NewsRepository newsRepository;

  GetBusinessNewsUseCase({required this.newsRepository});
  @override
  Future<Either<Failure, List<News>>> call(NoParameters parameters) async{
    return await newsRepository.getBusinessNews();
  }
}