import 'package:news_app/features/home/presentation/views_model/home_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@riverpod
HomeNotifier home(ref) {
  return HomeNotifier();
}
