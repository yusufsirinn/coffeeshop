part of '../login_page.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -154),
      child: SizedBox(
        child: Image.asset(
          Images.coffeeSoGood.png,
          fit: BoxFit.fitWidth,
          width: 458,
          height: 702,
        ),
      ),
    );
  }
}
