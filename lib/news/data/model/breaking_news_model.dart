import 'package:news_app/news/domain/entity/breaking_news.dart';

class BreakingNewsModel extends BreakingNews {
  const BreakingNewsModel({
    required super.title,
    required super.description,
    required super.content,
    required super.pubDate,
    required super.imageUrl,
    required super.sourceId,
    required super.creator,
  });

  factory BreakingNewsModel.fromJson(Map<String, dynamic> json) {
    return BreakingNewsModel(
      title: json['title']??'',
      description: json['description']??'"Canterbury fire evacuees are set to return home after a close call, but need to stay prepared for possible future evacuations if conditions change. The fire at Pegasus Beach, north of Christchurch, has ravaged more than 200 hectares of coastland since igniting about 8pm on Wednesday. Police area commander Peter Cooper said officers were following strong lines of inquiries but early indications were that fireworks may have been involved.',
      content: json['content']??'',
      pubDate: json['pubDate']??'',
      imageUrl: json['image_url']??'https://cdn.head-fi.org/assets/classifieds/hf-classifieds_no-image-available_2.jpg',
      sourceId: json['source_id']??'',
      creator: json['creator']??['CNBC' ,'HYPEBEAST'],
    );
  }
}
