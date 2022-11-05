part of 'news_bloc.dart';

class NewsState extends Equatable {
  final List<News> sportNews;
  final RequestState sportNewsState;
  final String sportNewsMessage;

  final List<News> healthNews;
  final RequestState healthNewsState;
  final String healthNewsMessage;
  final List<News> scienceNews;
  final RequestState scienceNewsState;
  final String scienceNewsMessage;
  final List<News> entertainmentNews;
  final RequestState entertainmentNewsState;
  final String entertainmentNewsMessage;
  final List<BreakingNews> breakingNews;
  final RequestState breakingNewsState;
  final String breakingNewsMessage;
  final List<News> searchNews;
  final RequestState searchNewsState;
  final String searchNewsMessage;

  const NewsState({
    this.sportNews = const [],
    this.sportNewsState = RequestState.isLoading,
    this.sportNewsMessage = '',

    this.searchNews = const [],
    this.searchNewsState = RequestState.isLoading,
    this.searchNewsMessage = '',
    this.healthNews = const [],
    this.healthNewsState = RequestState.isLoading,
    this.healthNewsMessage = '',
    this.scienceNews = const [],
    this.scienceNewsState = RequestState.isLoading,
    this.scienceNewsMessage = '',
    this.entertainmentNews = const [],
    this.entertainmentNewsState = RequestState.isLoading,
    this.entertainmentNewsMessage = '',
    this.breakingNews = const [],
    this.breakingNewsState = RequestState.isLoading,
    this.breakingNewsMessage = '',
  });

  NewsState copyWith({
    List<News>? sportNews,
    RequestState? sportNewsState,
    String? sportNewsMessage,

    List<News>? healthNews,
    RequestState? healthNewsState,
    String? healthNewsMessage,
    List<News>? scienceNews,
    RequestState? scienceNewsState,
    String? scienceNewsMessage,
    List<News>? entertainmentNews,
    RequestState? entertainmentNewsState,
    String? entertainmentNewsMessage,
    List<BreakingNews>? breakingNews,
    RequestState? breakingNewsState,
    String? breakingNewsMessage,
    List<News>? searchNews,
    RequestState? searchNewsState,
    String? searchNewsMessage,
  }) {
    return NewsState(
      sportNews: sportNews ?? this.sportNews,
      sportNewsState: sportNewsState ?? this.sportNewsState,
      sportNewsMessage: sportNewsMessage ?? this.sportNewsMessage,
      healthNews: healthNews ?? this.healthNews,
      healthNewsState: healthNewsState ?? this.healthNewsState,
      healthNewsMessage: healthNewsMessage ?? this.healthNewsMessage,
      scienceNews: scienceNews ?? this.scienceNews,
      scienceNewsState: scienceNewsState ?? this.scienceNewsState,
      scienceNewsMessage: scienceNewsMessage ?? this.scienceNewsMessage,
      entertainmentNews: entertainmentNews ?? this.entertainmentNews,
      entertainmentNewsState:
          entertainmentNewsState ?? this.entertainmentNewsState,
      entertainmentNewsMessage:
          entertainmentNewsMessage ?? this.entertainmentNewsMessage,
      breakingNews: breakingNews ?? this.breakingNews,
      breakingNewsState: breakingNewsState ?? this.breakingNewsState,
      breakingNewsMessage: breakingNewsMessage ?? this.breakingNewsMessage,
      searchNews: searchNews ?? this.searchNews,
      searchNewsState: searchNewsState ?? this.searchNewsState,
      searchNewsMessage: searchNewsMessage ?? this.searchNewsMessage,

    );
  }

  @override
  List<Object> get props => [
        sportNews,
        sportNewsState,
        sportNewsMessage,

        healthNews,
        healthNewsState,
        healthNewsMessage,
        scienceNews,
        scienceNewsState,
        scienceNewsMessage,
        entertainmentNews,
        entertainmentNewsState,
        entertainmentNewsMessage,
        breakingNews,
        breakingNewsState,
        breakingNewsMessage,
        searchNews,
        searchNewsState,
        searchNewsMessage,
      ];
}
