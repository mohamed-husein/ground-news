import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_sizes.dart';
import 'package:news_app/core/widgets/custom_text.dart';
import 'package:news_app/core/widgets/divider.dart';
import 'package:news_app/news/domain/entity/news.dart';
import 'package:news_app/news/presentation/screens/details_screen.dart';
import 'package:news_app/news/presentation/widgets/article_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key, required this.title, required this.news})
      : super(key: key);
  final String title;
  final List<News> news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: AppSizes.pW22,
        title: CustomText.titleMedium(title, context: context),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.pW12),
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ArticleWidget(
                image: news[index].image,
                title: news[index].title,
                date: news[index].publishedAt,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        circleChar: news[index].name,
                        authName: news[index].name,
                        date: news[index].publishedAt,
                        description: news[index].description,
                        title: news[index].title,
                        image: news[index].image,
                      ),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (context, index) {
              return DividerWidget(height: AppSizes.pH12);
            },
            itemCount: news.length),
      ),
    );
  }
}
