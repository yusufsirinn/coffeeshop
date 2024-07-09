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
        horizontal: 30,
      ),
      child: SizedBox(
        height: 52,
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
                top: 16,
                bottom: 16,
                left: 21,
                right: 12,
              ),
              child: SvgPicture.asset(
                AppIcons.searchNormal.svg,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
            suffixIcon: Container(
              width: 44,
              height: 44,
              margin: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 5,
              ),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.orangeSalmon,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SvgPicture.asset(AppIcons.filter.svg),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle? textStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColors.mountainMist,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        );
  }
}
