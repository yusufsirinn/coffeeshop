part of '../home_page.dart';

class HomePageSearchCoffee extends StatelessWidget {
  final Function(String)? onChanged;
  const HomePageSearchCoffee({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimension.x30,
      ),
      child: SizedBox(
        height: AppDimension.x52,
        child: TextField(
          onChanged: onChanged,
          style: textStyle(context),
          cursorColor: AppColors.mountainMist,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.dune,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            label: Text(
              context.tr('home.textField.label'),
              style: textStyle(context),
            ),
            labelStyle: textStyle(context),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(
                top: AppDimension.x16,
                bottom: AppDimension.x16,
                left: AppDimension.x20,
                right: AppDimension.x12,
              ),
              child: SvgPicture.asset(
                AppIcons.searchNormal.svg,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(AppDimension.x16),
            ),
            suffixIcon: Container(
              width: AppDimension.x44,
              height: AppDimension.x44,
              margin: const EdgeInsets.symmetric(
                vertical: AppDimension.x4,
                horizontal: AppDimension.x4,
              ),
              padding: const EdgeInsets.all(AppDimension.x12),
              decoration: BoxDecoration(
                color: AppColors.orangeSalmon,
                borderRadius: BorderRadius.circular(AppDimension.x12),
              ),
              child: SvgPicture.asset(AppIcons.filter.svg),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle? textStyle(BuildContext context) {
    return AppTextStyle.regular14(AppColors.mountainMist);
  }
}
