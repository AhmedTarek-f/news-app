import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/core/constants/app_text.dart';
import 'package:news_app/core/shimmer/shimmer_effect.dart';
import 'package:news_app/features/news/data/models/article/article_model.dart';

class NewsDetailsSheetContent extends StatelessWidget {
  const NewsDetailsSheetContent({super.key, required this.articleData});
  final ArticleModel articleData;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(8),
      margin: REdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.6)),
        boxShadow: [
          BoxShadow(
            color: AppColors.white.withValues(alpha: 0.8),
            blurStyle: BlurStyle.outer,
            blurRadius: 8.r,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl: articleData.urlToImage ?? "",
              width: ScreenUtil().screenWidth,
              height: 220.h,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) =>
                  ShimmerEffect(width: ScreenUtil().screenWidth, height: 220.h),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.info_outline, color: Colors.red),
            ),
          ),
          const RSizedBox(height: 8),
          Text(
            articleData.description ?? "",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              letterSpacing: 0.22,
              color: Theme.of(context).colorScheme.primary,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          const RSizedBox(height: 8),
          RSizedBox(
            width: ScreenUtil().screenWidth,
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(16.r),
                ),
              ),
              onPressed: () {},
              child: Text(
                AppText.viewFullArticle,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(letterSpacing: 0.22),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
