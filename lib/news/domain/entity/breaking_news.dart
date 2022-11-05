import 'package:equatable/equatable.dart';

class BreakingNews extends Equatable {
  final String title;
  final String description;
  final String content;
  final String imageUrl;
  final String pubDate;
  final String sourceId;
  final List<dynamic> creator;

  const BreakingNews({
    required this.title,
    required this.description,
    required this.content,
    required this.imageUrl,
    required this.creator,
    required this.pubDate,
    required this.sourceId,
  });

  @override
  List<Object> get props => [
        title,
        description,
        content,
        pubDate,
        imageUrl,
        sourceId,
    creator
      ];
}
