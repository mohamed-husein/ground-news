import 'package:flutter/material.dart';
import 'package:news_app/core/global/theme_color/theme_color_light.dart';
import 'package:news_app/core/utils/app_constants.dart';
import 'package:news_app/core/utils/app_sizes.dart';
import 'package:news_app/core/widgets/custom_text.dart';
import 'package:news_app/core/widgets/divider.dart';
import 'package:news_app/core/widgets/images/custom_avatar_image.dart';
import 'package:news_app/core/widgets/images/custom_network_image.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen(
      {Key? key,
      required this.circleChar,
      required this.authName,
      required this.date,
      required this.description,
      required this.title,
      required this.image,})
      : super(key: key);
  final String circleChar;
  final String authName;
  final String date;
  final String description;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DividerWidget(height: AppSizes.sizedBoxHeightMedium),
              Row(
                children: [
                  CircleAvatar(
                    radius: AppSizes.br25,
                    backgroundColor: ThemeColorLight.primaryColor,
                    child: Padding(
                      padding: EdgeInsets.only(top: AppSizes.pH5),
                      child: CustomText(
                        circleChar[0],
                        context: context,
                        textAlign: TextAlign.center,
                        textStyle:
                            Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppSizes.pW10),
                    child: Container(
                      height: AppSizes.pH50,
                      width: AppSizes.pW2,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: AppSizes.pH50,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: AppSizes.pH4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText.labelLarge(
                              date,
                              context: context,
                            ),
                            CustomText.titleLarge(
                              authName,
                              context: context,
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              DividerWidget(height: AppSizes.sizedBoxHeightMedium),
              CustomText.titleMedium(
                title,
                context: context,
                textAlign: TextAlign.start,
              ),
              DividerWidget(height: AppSizes.sizedBoxHeightSimiTiny),
              CustomText(
                description,
                context: context,
                textAlign: TextAlign.start,
                textStyle: Theme.of(context).textTheme.displaySmall,
              ),
              DividerWidget(height: AppSizes.sizedBoxHeightSmall),
              CustomNetworkImage(
                path: image,
                radius: BorderRadius.circular(20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
