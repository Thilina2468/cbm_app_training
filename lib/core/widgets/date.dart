import 'package:flutter/material.dart';
import 'package:kyc_practice_app/core/constants/app_colors.dart';
import 'package:kyc_practice_app/core/constants/app_sizes.dart';
import 'package:kyc_practice_app/core/constants/app_space.dart';
import 'package:kyc_practice_app/core/theme/app_styles.dart';

class Date extends StatefulWidget {
  final String hintText;

  const Date({super.key, required this.hintText});

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      final String day = picked.day.toString().padLeft(2, '0');
      final String month = picked.month.toString().padLeft(2, '0');
      setState(() {
        _controller.text = '$day/$month/${picked.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      onTap: _pickDate,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.radiusMd)),
          borderSide: BorderSide(color: AppColors.textDisabled),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.radiusMd)),
          borderSide: BorderSide(color: AppColors.borderFocused),
        ),
        labelText: widget.hintText,
        labelStyle: AppStyles.bodyLarge(context),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(AppSpace.s12),
          child: Image.asset(
            'assets/images/icon_calendar.png',
            width: AppSizes.iconMd,
            height: AppSizes.iconMd,
          ),
        ),
      ),
    );
  }
}
