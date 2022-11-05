part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class SportsEvent extends NewsEvent{
  @override
  List<Object?> get props => [];
}
class HealthEvent extends NewsEvent{
  @override
  List<Object?> get props => [];
}
class ScienceEvent extends NewsEvent{
  @override
  List<Object?> get props => [];
}
class EntertainmentEvent extends NewsEvent{
  @override
  List<Object?> get props => [];
}
class BreakingNewsEvent extends NewsEvent{
  const BreakingNewsEvent();
  @override
  List<Object?> get props => [];
}
class SearchEvent extends NewsEvent {
  final String searchWord;

  const SearchEvent({required this.searchWord});

  @override
  List<Object?> get props => [];
}
