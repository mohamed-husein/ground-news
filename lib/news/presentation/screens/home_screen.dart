import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/global/theme_color/theme_color_light.dart';
import 'package:news_app/core/services/service_locator.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_constants.dart';
import 'package:news_app/core/utils/app_sizes.dart';
import 'package:news_app/core/widgets/custom_text.dart';
import 'package:news_app/core/widgets/divider.dart';
import 'package:news_app/core/widgets/images/custom_png_image.dart';
import 'package:news_app/core/widgets/images/custom_svg_image.dart';
import 'package:news_app/news/presentation/controller/news_bloc.dart';
import 'package:news_app/news/presentation/screens/news_screen.dart';
import 'package:news_app/news/presentation/screens/search_screen.dart';
import 'package:news_app/news/presentation/widgets/breaking_news_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (context) => sl<NewsBloc>()
        ..add(const BreakingNewsEvent())
        ..add(SportsEvent())
        ..add(EntertainmentEvent())
        ..add(HealthEvent())
        ..add(ScienceEvent()),
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: AppSizes.pW22,
          title:
              CustomText.titleMedium(AppConstants.appTitle, context: context),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: AppSizes.pW22),
              child: CustomSvgImage.icons(
                path: AppAssets.menu,
                height: AppSizes.smallIconSize,
                color: ThemeColorLight.grayscaleBold,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.pW22),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DividerWidget(
                  height: AppSizes.sizedBoxHeightSmall,
                ),
                CustomText.displayMedium(
                  AppConstants.hello,
                  context: context,
                ),
                DividerWidget(
                  height: AppSizes.sizedBoxHeightTiny,
                ),
                CustomText.displayLarge(
                  AppConstants.discover,
                  context: context,
                  textAlign: TextAlign.left,
                ),
                DividerWidget(
                  height: AppSizes.sizedBoxHeightTiny,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SearchScreen(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizes.br10),
                        border: Border.all(color: ThemeColorLight.greyBorder)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: AppSizes.pW12),
                          child: CustomText.displaySmall('Search For News',
                              context: context),
                        ),
                        Container(
                          height: AppSizes.mediumButtonHeight,
                          width: AppSizes.mediumButtonWidth,
                          decoration: BoxDecoration(
                              color: ThemeColorLight.primaryColor,
                              borderRadius:
                                  BorderRadius.circular(AppSizes.br10)),
                          child: const Icon(
                            Icons.search,
                            color: ThemeColorLight.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                DividerWidget(
                  height: AppSizes.sizedBoxHeightSmall,
                ),
                BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        sportCategory(context, onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsScreen(
                                    title: 'Sport News', news: state.sportNews),
                              ));
                        }),
                        categoryItem(
                            text: AppConstants.entertainment,
                            context: context,
                            path: AppAssets.businessImage,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewsScreen(
                                        title: 'Business News',
                                        news: state.entertainmentNews),
                                  ));
                            }),
                        categoryItem(
                            text: AppConstants.health,
                            context: context,
                            path: AppAssets.healthImage,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewsScreen(
                                        title: 'Health News',
                                        news: state.healthNews),
                                  ));
                            }),
                        categoryItem(
                            text: AppConstants.science,
                            context: context,
                            path: AppAssets.scienceImage,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewsScreen(
                                        title: 'Science News',
                                        news: state.scienceNews),
                                  ));
                            }),
                      ],
                    );
                  },
                ),
                DividerWidget(
                  height: AppSizes.sizedBoxHeightSmall,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: AppSizes.pH25,
                      width: AppSizes.pW4,
                      color: ThemeColorLight.primaryColor,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: AppSizes.pH5, left: AppSizes.pW10),
                      child: CustomText.titleSmall(
                        'Breaking News',
                        context: context,
                      ),
                    ),
                  ],
                ),
                DividerWidget(
                  height: AppSizes.sizedBoxHeightTiny,
                ),
                const BreakingNewsWidget(),
                DividerWidget(
                  height: AppSizes.sizedBoxHeightTiny,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryItem(
      {required String text,
      required String path,
      required BuildContext context,
      required GestureTapCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: Colors.grey.shade200,
            child: CustomPngImage.square(
              path: path,
              width: 30,
              height: AppSizes.imageHeightSimiTiny,
            ),
          ),
          DividerWidget(
            height: AppSizes.pH8,
          ),
          CustomText.labelMedium(text, context: context)
        ],
      ),
    );
  }

  Widget sportCategory(context, {required GestureTapCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: Colors.orange.shade50,
            child: CustomSvgImage(
              path: AppAssets.sportsSvg,
              color: ThemeColorLight.primaryColor,
              height: AppSizes.imageHeightSimiTiny,
            ),
          ),
          DividerWidget(
            height: AppSizes.pH8,
          ),
          CustomText.labelSmall('Sports', context: context)
        ],
      ),
    );
  }
}
