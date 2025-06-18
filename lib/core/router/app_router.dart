import 'package:flutter/material.dart';
import 'package:news_app/core/router/route_names.dart';
import 'package:news_app/features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static Map<String, Widget Function(BuildContext)> routes = {
    RouteNames.home: (_) => const HomeView(),
  };
}
