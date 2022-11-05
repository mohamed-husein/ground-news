import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/core/utils/app_constants.dart';
import 'package:news_app/news/domain/entity/news.dart';

import '../../domain/use_case_impl/search_by_word_use_case.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchNewsByWordUseCase getSearchNewsUseCase;

  SearchBloc({required this.getSearchNewsUseCase}) : super(SearchInitial()) {
    on<GetSearchNewsEvent>(_getSearchNews);
  }

  FutureOr<void> _getSearchNews(
      GetSearchNewsEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoading());

    final results = await getSearchNewsUseCase
        .call(SearchParameters(searchWord: event.query));

    results.fold(
      (l) => emit(
        SearchError(_mapFailureToString(l)),
      ),
      (r) => emit(
        SearchLoaded(
          news: r,
        ),
      ),
    );
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
