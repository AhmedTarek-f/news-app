import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/home/presentation/views_model/home_notifier.dart';

final homeProvider = Provider((ref) => HomeNotifier());
