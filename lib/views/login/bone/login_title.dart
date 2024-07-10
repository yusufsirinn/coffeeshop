part of '../login_page.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 15,
      ),
      child: Text(
        context.tr('login.title'),
        textAlign: TextAlign.center,
        style: AppTextStyle.semiBold34(Colors.white),
      ),
    );
  }
}
