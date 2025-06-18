import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/core/constants/app_icons.dart';
import 'package:news_app/core/constants/app_text.dart';
import 'package:news_app/core/shimmer/shimmer_effect.dart';
import 'package:news_app/features/home/data/models/home_card_model.dart';

class RightContentContainer extends StatelessWidget {
  const RightContentContainer({super.key, required this.cardData});
  final HomeCardModel cardData;
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        Theme.of(context).colorScheme.brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {},
      child: RPadding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          width: ScreenUtil().screenWidth,
          height: 198.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24.r)),
          child: Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.r),
                  child: Image.asset(
                    isDarkMode
                        ? cardData.cardImageLight
                        : cardData.cardImageDark,
                    fit: BoxFit.cover,
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                          if (frame != null) {
                            return child;
                          } else {
                            return ShimmerEffect(
                              width: ScreenUtil().screenWidth,
                              height: 198.h,
                            );
                          }
                        },
                  ),
                ),
              ),
              Padding(
                padding: REdgeInsetsDirectional.only(end: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 2),
                    Padding(
                      padding: REdgeInsetsDirectional.only(end: 28),
                      child: Text(
                        cardData.cardName,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    const Spacer(flex: 3),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.gray,
                        borderRadius: BorderRadius.circular(84.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: REdgeInsetsDirectional.only(
                              start: 16,
                              end: 10,
                              bottom: 8,
                              top: 8,
                            ),
                            child: Text(
                              AppText.viewAll,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                          Container(
                            width: 54.r,
                            height: 54.r,
                            padding: REdgeInsets.all(15.r),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              isDarkMode
                                  ? AppIcons.arrowRightDark
                                  : AppIcons.arrowRightLight,
                              width: 24.r,
                              height: 24.r,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
