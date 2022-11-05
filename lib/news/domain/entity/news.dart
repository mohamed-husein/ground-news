import 'package:equatable/equatable.dart';

class News extends Equatable {
  final String title;
  final String description;
  final String content;
  final String image;
  final String publishedAt;
  final String author;
  final String name;

  const News({
    required this.title,
    required this.image,
    required this.description,
    required this.content,
    required this.publishedAt,
    required this.author,
    required this.name,
  });

  @override
  List<Object> get props =>
      [title, description, content, publishedAt, author, name,image];
}