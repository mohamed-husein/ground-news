import 'package:news_app/news/domain/entity/news.dart';

class NewsModel extends News {
  const NewsModel({
    required super.title,
    required super.description,
    required super.image,
    required super.content,
    required super.publishedAt,
    required super.author,
    required super.name,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title']??'',
      description: json['description']??'Nearly \$2bn (£1.75bn) has been spent on virtual land in the past 12 months, as people and companies race to get a foothold in the metaverse, research shows. ...',
      content: json['content']??'',
      image: json['urlToImage']??'https://cdn.head-fi.org/assets/classifieds/hf-classifieds_no-image-available_2.jpg',
      publishedAt: json['publishedAt']??'',
      author: json['author']??'CNBC',
      name: json['source']['name']??'CNBC',
    );
  }
}
