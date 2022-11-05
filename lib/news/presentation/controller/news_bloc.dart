import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/enums/request_state.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/core/use_case/use_case.dart';
import 'package:news_app/core/utils/app_constants.dart';
import 'package:news_app/news/domain/entity/breaking_news.dart';
import 'package:news_app/news/domain/entity/news.dart';
import 'package:news_app/news/domain/use_case_impl/breaking_news_use_case.dart';
import 'package:news_app/news/domain/use_case_impl/business_new_use_case.dart';
import 'package:news_app/news/domain/use_case_impl/health_news_use_case.dart';
import 'package:news_app/news/domain/use_case_impl/science_news_use_case.dart';
import 'package:news_app/news/domain/use_case_impl/search_by_word_use_case.dart';
import 'package:news_app/news/domain/use_case_impl/sports_news_use_case.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetBreakingNewsUseCase getBreakingNewsUseCase;
  final GetBusinessNewsUseCase getEntertainmentNewsUseCase;
  final GetHealthNewsUseCase getHealthNewsUseCase;
  final GetScienceNewsUseCase getScienceNewsUseCase;
  final GetSearchNewsByWordUseCase getSearchNewsByWordUseCase;
  final GetSportsNewsUseCase getSportsNewsUseCase;

  NewsBloc({
    required this.getSportsNewsUseCase,
    required this.getSearchNewsByWordUseCase,
    required this.getScienceNewsUseCase,
    required this.getHealthNewsUseCase,
    required this.getEntertainmentNewsUseCase,
    required this.getBreakingNewsUseCase,
  }) : super(const NewsState()) {
    on<SportsEvent>(_getSportNews);
    on<HealthEvent>(_getHealthNews);
    on<ScienceEvent>(_getScienceNews);
    on<EntertainmentEvent>(_getEntertainmentNews);
    on<BreakingNewsEvent>(_getBreakingNews);
    on<SearchEvent>(_getSearchNews);
  }

  FutureOr<void> _getSportNews(
      SportsEvent event, Emitter<NewsState> emit) async {
    final result = await getSportsNewsUseCase.call(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            sportNewsState: RequestState.isLoading,
            sportNewsMessage: _mapFailureToString(l))),
        (r) => emit(state.copyWith(
            sportNews: r, sportNewsState: RequestState.isLoaded)));
  }

  FutureOr<void> _getHealthNews(
      HealthEvent event, Emitter<NewsState> emit) async {
    final result = await getHealthNewsUseCase.call(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            healthNewsState: RequestState.isLoading,
            healthNewsMessage: _mapFailureToString(l))),
        (r) => emit(state.copyWith(
            healthNews: r, healthNewsState: RequestState.isLoaded)));
  }

  FutureOr<void> _getScienceNews(
      ScienceEvent event, Emitter<NewsState> emit) async {
    final result = await getScienceNewsUseCase.call(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            scienceNewsMessage: _mapFailureToString(l),
            scienceNewsState: RequestState.isLoading)),
        (r) => emit(state.copyWith(
            scienceNews: r, scienceNewsState: RequestState.isLoaded)));
  }

  FutureOr<void> _getEntertainmentNews(
      EntertainmentEvent event, Emitter<NewsState> emit) async {
    final result = await getEntertainmentNewsUseCase.call(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            entertainmentNewsMessage: _mapFailureToString(l),
            entertainmentNewsState: RequestState.isLoading)),
        (r) => emit(state.copyWith(
            entertainmentNews: r,
            entertainmentNewsState: RequestState.isLoaded)));
  }

  FutureOr<void> _getBreakingNews(
      BreakingNewsEvent event, Emitter<NewsState> emit) async {
    final result = await getBreakingNewsUseCase.call(const NoParameters());
    debugPrint(result.toString());
    result.fold(
        (l) => emit(state.copyWith(
            breakingNewsMessage: _mapFailureToString(l),
            breakingNewsState: RequestState.isLoading)),
        (r) => emit(state.copyWith(
            breakingNews: r, breakingNewsState: RequestState.isLoaded)));
  }

  FutureOr<void> _getSearchNews(
      SearchEvent event, Emitter<NewsState> emit) async {
    final result = await getSearchNewsByWordUseCase
        .call(SearchParameters(searchWord: event.searchWord));
    result.fold(
        (l) => emit(state.copyWith(
            searchNewsMessage: _mapFailureToString(l),
            searchNewsState: RequestState.isLoading)),
        (r) => emit(state.copyWith(
            searchNews: r, searchNewsState: RequestState.isLoaded)));
  }

  String _mapFailureToString(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppConstants.serverFailure;
      default:
        return AppConstants.unExpectedFailure;
    }
  }

}
