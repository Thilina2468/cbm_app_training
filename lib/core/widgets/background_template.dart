import 'package:flutter/material.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';
import 'package:kyc_practice_app/core/constants/app_colors.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/theme/app_styles.dart';
import 'package:kyc_practice_app/core/widgets/footer.dart';

class BackgroundTemplate extends StatelessWidget {
  static const double _gradientEnd = 0.27;
  static const double _titleTopFraction = 0.15;
  static const double _ringSize = 600;
  static const double _ringWidth = 4;

  final String? title;
  final String? subtitle;
  final double? cardHeight;
  final Widget child;
  final Widget? footer;

  const BackgroundTemplate({
    super.key,
    this.title,
    this.subtitle,
    this.cardHeight,
    this.footer,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.gradientTop,
              AppColors.gradientBottom,
            ],
            stops: [0, _gradientEnd],
          ),
        ),
      ),
      Positioned(
        top: -80,
        right: 100,
        child: Container(
          width: _ringSize,
          height: _ringSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.ring,
              width: _ringWidth,
            ),
          ),
        ),
      ),
      Positioned(
        top: 40,
        right: -430,
        child: Container(
          width: _ringSize,
          height: _ringSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.ring,
              width: _ringWidth,
            ),
          ),
        ),
      ),
      Positioned.fill(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (title != null || subtitle != null)
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * _titleTopFraction,
                  left: AppSpace.s32,
                  right: AppSpace.s32,
                  bottom: AppSpace.s24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null)
                      Text(title!, style: AppStyles.title(context)),
                    AppSpace.h8,
                    if (subtitle != null)
                      Text(subtitle!, style: AppStyles.subtitle(context)),
                  ],
                ),
              ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: cardHeight,
                  decoration: const BoxDecoration(
                    color: AppColors.surfacePrimary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppSizes.radiusLg),
                      topRight: Radius.circular(AppSizes.radiusLg),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: cardHeight == null
                        ? MainAxisSize.min
                        : MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Flexible(
                        fit: cardHeight == null ? FlexFit.loose : FlexFit.tight,
                        child: SingleChildScrollView(
                          padding: EdgeInsets.fromLTRB(
                            AppSpace.s32,
                            AppSpace.s32,
                            AppSpace.s32,
                            footer == null ? AppSpace.s32 : AppSpace.s16,
                          ),
                          child: child,
                        ),
                      ),
                      if (footer != null) Footer(child: footer!),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
