import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../blocs/coffee_bloc/coffee_bloc.dart';
import '../../../core/core.dart';
import '../../../design_system/design_system.dart';
import '../order/order_page.dart';

part '../detail/bone/detail_coffee_image.dart';
part '../detail/bone/detail_coffee_start_rating.dart';
part '../detail/bone/detail_coffee_size_list.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedSizeIndex = 1;
  List<String> coffeeSizeList = ['S', 'M', 'L'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 24),
        child: CSAppBar(
          title: context.tr('detail.title'),
          trailing: SvgPicture.asset(AppIcons.lightHeart.svg),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 28),
              DetailCoffeeImage(imageUrl: context.watch<CoffeeBloc>().state.selectedCoffee.image),
              const SizedBox(height: 20),
              DetailCoffeeStarRating(
                name: context.watch<CoffeeBloc>().state.selectedCoffee.title ?? '',
                ingredients: context.watch<CoffeeBloc>().state.selectedCoffee.ingredients ?? [],
              ),
              const SizedBox(height: 28),
              const CSDivider(),
              const SizedBox(height: 20),
              title(context.tr('detail.description')),
              const SizedBox(height: 15),
              CSReadMoreText(
                trimLines: 3,
                textStyle: AppTextStyle.regular14(AppColors.starDust),
                showLessText: context.tr('detail.read.less'),
                readMoreText: context.tr('detail.read.more'),
                readMoreStyle: AppTextStyle.semiBold14(AppColors.orangeSalmon),
                text: context.watch<CoffeeBloc>().state.selectedCoffee.description ?? '',
              ),
              const SizedBox(height: 22),
              title(context.tr('detail.size')),
              const SizedBox(height: 12),
              DetailCoffeeSizeList(
                coffeeSizeList: coffeeSizeList,
                selectedSizeIndex: selectedSizeIndex,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: navBar(context),
    );
  }

  CSBottomNavigationBarContainer navBar(BuildContext context) {
    return CSBottomNavigationBarContainer(
      height: 110,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr('detail.navBar.price'),
                  style: AppTextStyle.regular14(AppColors.starDust),
                ),
                const SizedBox(height: 8),
                Text(
                  r'$ ' + context.watch<CoffeeBloc>().state.selectedCoffee.price.toString(),
                  style: AppTextStyle.semiBold18(AppColors.orangeSalmon),
                ),
              ],
            ),
            const SizedBox(width: 45),
            Expanded(
              child: CSButton(
                text: 'detail.navBar.button',
                onPressed: () => AppNavigator.instance.go(const OrderPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text title(String text) {
    return Text(
      text,
      style: AppTextStyle.semiBold16(AppColors.thunder),
    );
  }
}
