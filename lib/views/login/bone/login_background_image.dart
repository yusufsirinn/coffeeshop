part of '../login_page.dart';

class LoginBackgroundImage extends StatelessWidget {
  const LoginBackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ClipRect(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                heightFactor: .50,
                widthFactor: .95,
                child: Center(
                  child: Image.asset(AppImages.coffeeSoGood.png),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
