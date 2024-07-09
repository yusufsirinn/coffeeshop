part of '../login_page.dart';

class LoginSubtitle extends StatelessWidget {
  const LoginSubtitle({
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
        style: context.theme.textTheme.labelSmall?.copyWith(
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
