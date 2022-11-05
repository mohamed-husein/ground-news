import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/exceptions.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/news/data/datasource/news_remote_datasource.dart';
import 'package:news_app/news/domain/entity/breaking_news.dart';
import 'package:news_app/news/domain/entity/news.dart';
import 'package:news_app/news/domain/repository/news_repository.dart';
import 'package:news_app/news/domain/use_case_impl/search_by_word_use_case.dart';

class NewsRepositoryImpl implements NewsRepository{

  final NewsRemoteDatasource newsRemoteDatasource;

  NewsRepositoryImpl({required this.newsRemoteDatasource});
  @override
  Future<Either<Failure, List<BreakingNews>>> getBreakingNews()async {
    final result =await newsRemoteDatasource.getBreakingNewsDataSource();
    try{
      return Right(result);
    }
    on ServerException {
      return Left(ServerFailure());
    }
  }


  @override
  Future<Either<Failure, List<News>>> getBusinessNews()async {
    final result = await newsRemoteDatasource.getBusinessNewsDataSource();
    try{
      return Right(result);
    }
    on ServerException {
      return Left(ServerFailure());
    }
  }


  @override
  Future<Either<Failure, List<News>>> getHealthNews()async {
    final result =await newsRemoteDatasource.getHealthNewsDataSource();
    try{
      return Right(result);
    }
    on ServerException {
      return Left(ServerFailure());
    }
  }


  @override
  Future<Either<Failure, List<News>>> getScienceNews()async {
    final result =await newsRemoteDatasource.getScienceNewsDataSource();
    try{
      return Right(result);
    }
    on ServerException {
      return Left(ServerFailure());
    }

  }

  @override
  Future<Either<Failure, List<News>>> getSearchNewsByWord( SearchParameters parameters)async {
    final result =await newsRemoteDatasource.getSearchNewsByWordDataSource(parameters);
    try{
      return Right(result);
    }
    on ServerException {
      return Left(ServerFailure());
    }
  }


  @override
  Future<Either<Failure, List<News>>> getSportsNews()async {
    final result =await newsRemoteDatasource.getSportsNewsDataSource();
    try{
      return Right(result);
    }
        on ServerException {
      return Left(ServerFailure());
        }
  }


}