import 'package:news_app/core/error/exceptions.dart';
import 'package:news_app/core/utils/api_constants.dart';
import 'package:news_app/news/data/model/breaking_news_model.dart';
import 'package:news_app/news/data/model/news_model.dart';
import 'package:news_app/news/domain/use_case_impl/search_by_word_use_case.dart';
import 'package:dio/dio.dart';

abstract class NewsRemoteDatasource {
  Future<List<NewsModel>> getSportsNewsDataSource();

  Future<List<NewsModel>> getHealthNewsDataSource();

  Future<List<NewsModel>> getScienceNewsDataSource();

  Future<List<NewsModel>> getBusinessNewsDataSource();

  Future<List<NewsModel>> getSearchNewsByWordDataSource(
      SearchParameters parameters);

  Future<List<BreakingNewsModel>> getBreakingNewsDataSource();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDatasource {
  @override
  Future<List<BreakingNewsModel>> getBreakingNewsDataSource() async {
    final response = await Dio().get(
        ApiConstants.breakingNewsPath);
    if (response.statusCode == 200) {
      return List<BreakingNewsModel>.from(response.data['results'].map((e) {
        return BreakingNewsModel.fromJson(e);
      }));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<NewsModel>> getBusinessNewsDataSource() async {
    final response = await Dio().get(ApiConstants.businessPath);
    if (response.statusCode == 200) {
      return List<NewsModel>.from((response.data['articles'] as List).map((e) {
        return NewsModel.fromJson(e);
      }));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<NewsModel>> getHealthNewsDataSource() async {
    final response = await Dio().get(ApiConstants.healthPath);
    if (response.statusCode == 200) {
      return List<NewsModel>.from((response.data['articles'] as List).map((e) {
        return NewsModel.fromJson(e);
      }));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<NewsModel>> getScienceNewsDataSource() async {
    final response = await Dio().get(ApiConstants.sciencePath);
    if (response.statusCode == 200) {
      return List<NewsModel>.from((response.data['articles'] as List).map((e) {
        return NewsModel.fromJson(e);
      }));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<NewsModel>> getSearchNewsByWordDataSource(
      SearchParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.searchPath(parameters.searchWord));
    if (response.statusCode == 200) {
      return List<NewsModel>.from((response.data['articles'] as List).map((e) {
        return NewsModel.fromJson(e);
      }));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<NewsModel>> getSportsNewsDataSource() async {
    final response = await Dio().get(ApiConstants.sportsPath);
    if (response.statusCode == 200) {
      return List<NewsModel>.from((response.data['articles'] as List).map((e) {
        return NewsModel.fromJson(e);
      }));
    } else {
      throw ServerException();
    }
  }
}
