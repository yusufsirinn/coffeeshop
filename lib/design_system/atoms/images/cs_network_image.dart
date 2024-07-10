import '../../../core/core.dart';
import 'package:flutter/material.dart';

class CSNetworkImage extends StatelessWidget {
  final String? image;
  const CSNetworkImage({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image ?? '',
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.dune,
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
    );
  }
}
