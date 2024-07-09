part of '../detail_page.dart';

class DetailCoffeeImage extends StatelessWidget {
  final String? imageUrl;
  const DetailCoffeeImage({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 226,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl ?? ''),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
