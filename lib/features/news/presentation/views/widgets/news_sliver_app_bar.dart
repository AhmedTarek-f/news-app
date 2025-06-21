import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/constants/app_icons.dart';

class NewsSliverAppBar extends StatelessWidget {
  const NewsSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final String appBarTitle =
        ModalRoute.of(context)?.settings.arguments as String;
    final isDarkMode =
        Theme.of(context).colorScheme.brightness == Brightness.dark;
    return SliverAppBar(
      scrolledUnderElevation: 0,
      title: Text(appBarTitle, style: Theme.of(context).textTheme.titleLarge),
      toolbarHeight: 40.h,
      centerTitle: true,
      actions: [
        Padding(
          padding: REdgeInsetsDirectional.only(end: 6),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              isDarkMode ? AppIcons.searchDark : AppIcons.searchLight,
              width: 24.r,
              height: 24.r,
            ),
          ),
        ),
      ],
    );
  }
}
