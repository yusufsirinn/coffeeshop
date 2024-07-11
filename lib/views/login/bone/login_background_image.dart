part of '../login_page.dart';

class LoginBackgroundImage extends StatelessWidget {
  const LoginBackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipRect(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Align(
            alignment: Alignment.bottomCenter,
            heightFactor: .85,
            widthFactor: .95,
            child: Center(
              child: Image.asset(AppImages.coffeeSoGood.png),
            ),
          ),
        ),
      ),
    );
  }
}
