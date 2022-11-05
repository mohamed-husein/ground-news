import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/enums/request_state.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_sizes.dart';
import 'package:news_app/core/widgets/divider.dart';
import 'package:news_app/news/presentation/controller/news_bloc.dart';
import 'package:news_app/news/presentation/screens/details_screen.dart';
import 'package:news_app/news/presentation/widgets/article_widget.dart';

class BreakingNewsWidget extends StatelessWidget {
  const BreakingNewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        switch (state.breakingNewsState) {
          case RequestState.isLoading:
            return Center(
                child: FadeInImage.assetNetwork(
              width: 250,
              height: 250,
              placeholderCacheWidth: 100,
              placeholderCacheHeight: 100,
              fit: BoxFit.cover,
              placeholder: AppAssets.loading,
              image:
                  'https://ar.limu.edu.ly/wp-content/uploads/sites/18/2020/10/pure-white-background-85a2a7fd.jpg',
            ));

          case RequestState.isLoaded:
            return ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ArticleWidget(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              circleChar: state.breakingNews[index].creator[0],
                              authName:
                                  state.breakingNews[index].creator.join('-'),
                              date: state.breakingNews[index].pubDate,
                              description:
                                  state.breakingNews[index].description,
                              title: state.breakingNews[index].title,
                              image: state.breakingNews[index].imageUrl,
                            ),
                          ),
                        );
                      },
                      image: state.breakingNews[index].imageUrl,
                      title: state.breakingNews[index].title,
                      date: state.breakingNews[index].pubDate);
                },
                separatorBuilder: (context, index) {
                  return DividerWidget(height: AppSizes.pH12);
                },
                itemCount: state.breakingNews.length);

          case RequestState.error:
            return Text(
              state.breakingNewsMessage,
            );
        }
      },
    );
  }
}

/**/
