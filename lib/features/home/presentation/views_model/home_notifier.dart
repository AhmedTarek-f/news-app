import 'package:news_app/core/constants/app_images.dart';
import 'package:news_app/features/home/data/models/home_card_model.dart';

class HomeNotifier {
  final List<HomeCardModel> cardsList = const [
    HomeCardModel(
      cardName: "General",
      cardImageLight: AppImages.generalLight,
      cardImageDark: AppImages.generalDark,
    ),
    HomeCardModel(
      cardName: "Business",
      cardImageLight: AppImages.busniessLight,
      cardImageDark: AppImages.busniessDark,
    ),
    HomeCardModel(
      cardName: "Sports",
      cardImageLight: AppImages.sportLight,
      cardImageDark: AppImages.sportDark,
    ),

    HomeCardModel(
      cardName: "Health",
      cardImageLight: AppImages.healthLight,
      cardImageDark: AppImages.healthDark,
    ),
    HomeCardModel(
      cardName: "Science",
      cardImageLight: AppImages.scienceLight,
      cardImageDark: AppImages.scienceDark,
    ),
    HomeCardModel(
      cardName: "Technology",
      cardImageLight: AppImages.technologyLight,
      cardImageDark: AppImages.technologyDark,
    ),
    HomeCardModel(
      cardName: "Entertainment",
      cardImageLight: AppImages.entertainmentLight,
      cardImageDark: AppImages.entertainmentDark,
    ),
  ];
}
