import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/global/theme_color/theme_color_light.dart';
import 'package:news_app/core/services/service_locator.dart';
import 'package:news_app/core/utils/app_constants.dart';
import 'package:news_app/core/utils/app_sizes.dart';
import 'package:news_app/core/widgets/divider.dart';
import 'package:news_app/core/widgets/images/custom_avatar_image.dart';
import 'package:news_app/news/presentation/controller/search_bloc.dart';
import 'package:news_app/news/presentation/screens/details_screen.dart';
import 'package:news_app/news/presentation/widgets/article_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => sl<SearchBloc>(),
      child: BlocBuilder<SearchBloc,SearchState>(
       builder: (context, state) {
         return Scaffold(
           appBar: AppBar(
             actions: [
               Padding(
                 padding:  EdgeInsets.only(right:AppSizes.pW22 ),
                 child: const CustomAvatarImage(AppConstants.profileImage),
               ),
             ],
           ),
           body: Padding(
             padding: EdgeInsets.symmetric(horizontal: AppSizes.pW22),
             child: SingleChildScrollView(
               physics: const BouncingScrollPhysics(),
               child: SingleChildScrollView(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     DividerWidget(height: AppSizes.sizedBoxHeightMedium),
                     Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(AppSizes.br10),
                           border:
                           Border.all(color: ThemeColorLight.greyBorder)),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Expanded(
                             child: Padding(
                               padding: EdgeInsets.only(left: AppSizes.pW12),
                               child: TextField(
                                 onSubmitted: (value) {
                                   context
                                       .read<SearchBloc>()
                                       .add(GetSearchNewsEvent(controller.text));
                                 },
                                 controller: controller,
                                 style: Theme.of(context).textTheme.bodySmall,
                                 decoration: const InputDecoration(
                                   border: InputBorder.none,
                                   enabledBorder: InputBorder.none,
                                   errorBorder: InputBorder.none,
                                   focusedBorder: InputBorder.none,
                                 ),
                               ),
                             ),
                           ),
                           InkWell(
                             onTap: () {
                               context
                                   .read<SearchBloc>()
                                   .add(GetSearchNewsEvent(controller.text));
                             },
                             child: Container(
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
                           ),
                         ],
                       ),
                     ),
                     DividerWidget(height: AppSizes.sizedBoxHeightSmall),
                     if (state is SearchLoading) const LinearProgressIndicator(color: ThemeColorLight.primaryColor),
                     if(state is SearchLoaded)
                       if(state.news.isEmpty)
                         const Center(child: Text("Empty",style: TextStyle(color: Colors.white,fontSize: 25),)),
                     if (state is SearchLoaded)
                       ListView.separated(
                           shrinkWrap: true,
                           physics: const NeverScrollableScrollPhysics(),
                           itemBuilder: (context, index) {
                             return ArticleWidget(
                                 image: state.news[index].image,
                                 title: state.news[index].title,
                                 date: state
                                     .news[index].publishedAt,onTap: (){
                               Navigator.pushReplacement(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => DetailsScreen(
                                     circleChar: state.news[index].name,
                                     authName: state.news[index].name,
                                     date: state.news[index].publishedAt,
                                     description: state.news[index].description,
                                     title: state.news[index].title,
                                     image: state.news[index].image,
                                   ),
                                 ),
                               );
                             },);

                           },
                           separatorBuilder: (context, index) {
                             return DividerWidget(
                                 height: AppSizes.pH12);
                           },
                           itemCount: state.news.length),
                   ],
                 ),
               ),
             ),
           ),
         );
       },
      ),
    );
  }
}
