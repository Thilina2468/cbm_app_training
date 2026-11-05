import 'package:flutter/material.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';
import 'package:kyc_practice_app/core/constants/app_colors.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/theme/app_styles.dart';

class InputField extends StatelessWidget {
  static const double _padding = 14;

  final String hintText;
  final String? iconAsset;

  const InputField({
    super.key,
    required this.hintText,
    this.iconAsset,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        constraints: const BoxConstraints(maxHeight: AppSizes.inputHeight),
        contentPadding: const EdgeInsets.all(_padding),
        filled: true,
        fillColor: AppColors.white,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.radiusMd)),
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.radiusMd)),
          borderSide: BorderSide(color: AppColors.borderFocused),
        ),
        labelText: hintText,
        labelStyle: AppStyles.bodyLarge(context),
        suffixIcon: iconAsset == null
            ? null
            : Padding(
                padding: const EdgeInsets.all(AppSpace.s12),
                child: Image.asset(
                  iconAsset!,
                  width: AppSizes.iconMd,
                  height: AppSizes.iconMd,
                ),
              ),
      ),
    );
  }
}
