import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_sizes.dart';
import 'package:news_app/core/widgets/custom_text.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({Key? key, required this.image, required this.title, required this.date, this.onTap}) : super(key: key);
  final String image;
  final String title;
  final String date;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: AppSizes.pW90,
                height: AppSizes.pH90,
                child: FadeInImage.assetNetwork(
                  width: 100,
                  height: 100,
                  placeholderCacheWidth: 100,
                  placeholderCacheHeight: 100,
                  fit: BoxFit.cover,
                  placeholder: AppAssets.loading,
                  image: image,
                )),
            Expanded(
              child: SizedBox(
                height:  AppSizes.pH90,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: AppSizes.pW12, ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.bodySmall(
                        title,
                        context: context,
                        maxLines: 3,
                        textAlign: TextAlign.left,
                      ),
                      CustomText(
                        date,
                        context: context,
                        maxLines: 3,
                        textStyle: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.left,
                      ),

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
