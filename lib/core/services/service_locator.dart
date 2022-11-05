import 'package:get_it/get_it.dart';
import 'package:news_app/news/data/datasource/news_remote_datasource.dart';
import 'package:news_app/news/data/repository/news_repository_impl.dart';
import 'package:news_app/news/domain/repository/news_repository.dart';
import 'package:news_app/news/domain/use_case_impl/breaking_news_use_case.dart';
import 'package:news_app/news/domain/use_case_impl/business_new_use_case.dart';
import 'package:news_app/news/domain/use_case_impl/health_news_use_case.dart';
import 'package:news_app/news/domain/use_case_impl/science_news_use_case.dart';
import 'package:news_app/news/domain/use_case_impl/search_by_word_use_case.dart';
import 'package:news_app/news/domain/use_case_impl/sports_news_use_case.dart';
import 'package:news_app/news/presentation/controller/news_bloc.dart';
import 'package:news_app/news/presentation/controller/search_bloc.dart';

GetIt sl = GetIt.instance;

class ServiceLocator {
  static init() {
    /// Use Cases
    sl.registerLazySingleton(
        () => GetBreakingNewsUseCase(newsRepository: sl()));
    sl.registerLazySingleton(
        () => GetBusinessNewsUseCase(newsRepository: sl()));
    sl.registerLazySingleton(() => GetHealthNewsUseCase(newsRepository: sl()));
    sl.registerLazySingleton(() => GetScienceNewsUseCase(newsRepository: sl()));
    sl.registerLazySingleton(
        () => GetSearchNewsByWordUseCase(newsRepository: sl()));
    sl.registerLazySingleton(() => GetSportsNewsUseCase(newsRepository: sl()));

    /// Repository
    sl.registerLazySingleton<NewsRepository>(
        () => NewsRepositoryImpl(newsRemoteDatasource: sl()));

    /// Data Source
    sl.registerLazySingleton<NewsRemoteDatasource>(
        () => NewsRemoteDataSourceImpl());

    /// Bloc
    sl.registerFactory(
      () => NewsBloc(
          getSportsNewsUseCase: sl(),
          getSearchNewsByWordUseCase: sl(),
          getScienceNewsUseCase: sl(),
          getHealthNewsUseCase: sl(),
          getEntertainmentNewsUseCase: sl(),
          getBreakingNewsUseCase: sl()),
    );

    sl.registerFactory(() => SearchBloc(getSearchNewsUseCase: sl()));
  }


}
