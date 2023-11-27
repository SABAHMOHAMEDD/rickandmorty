import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rick_and_morty/Core/constants/colors.dart';

class AppAnimatedLoading extends StatelessWidget {
  const AppAnimatedLoading({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Center(
        child: LoadingAnimationWidget.inkDrop(
      color: AppColors.kSecondryColor.withOpacity(.7),
      size: screenSize.width / 12,
    ));
  }
}
