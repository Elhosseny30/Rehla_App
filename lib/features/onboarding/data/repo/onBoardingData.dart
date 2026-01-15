import 'package:graduationproject/core/utils/imagesAssets.dart';
import 'package:graduationproject/core/utils/strings.dart';
import 'package:graduationproject/features/onboarding/data/model/onBoardingModel.dart';

List<OnBoardingModel> OnBoardingListDat = [
  OnBoardingModel(
    image: Assets.imagesFirstonbaordingillustration,
    title: OnBoardingStrings.firtImageTitle,
    text: OnBoardingStrings.firtImageText,
    height: 210,
  ),
  OnBoardingModel(
    image: Assets.imagesSecondonbaordingillustration,
    title: OnBoardingStrings.secondImageTitle,
    text: OnBoardingStrings.secondImageText,
    height: 192,
  ),
  OnBoardingModel(
    image: Assets.imagesThirdonbaordingillustration,
    title: OnBoardingStrings.thirdImageTitle,
    text: OnBoardingStrings.thirdImageText,
    height: 188,
  ),
];
