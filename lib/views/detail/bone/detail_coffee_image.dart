part of '../detail_page.dart';

class DetailCoffeeImage extends StatelessWidget {
  final String? imageUrl;
  const DetailCoffeeImage({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 226,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimension.x16),
        child: CSNetworkImage(
          image: imageUrl,
        ),
      ),
    );
  }
}
