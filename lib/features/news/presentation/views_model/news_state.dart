import 'package:news_app/core/exceptions/failure.dart';

class NewsState {}

final class NewsInitialState extends NewsState {}

final class FetchNewsSuccessState extends NewsState {}

final class FetchNewsLoadingState extends NewsState {}

final class FetchNewsFailureState extends NewsState {
  FetchNewsFailureState({required this.error});
  final Failure error;
}
