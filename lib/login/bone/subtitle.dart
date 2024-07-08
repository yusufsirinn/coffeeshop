part of '../views/login_page.dart';

class Subtitle extends StatelessWidget {
  const Subtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Text(
        context.tr('login.subtitle'),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.silverChalice,
              fontSize: 14,
              height: 1.54,
              fontWeight: FontWeight.w400,
              letterSpacing: 14 * .01,
            ),
      ),
    );
  }
}
