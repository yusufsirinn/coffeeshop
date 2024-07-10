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
        style: AppTextStyle.regular14(AppColors.silverChalice),
      ),
    );
  }
}
