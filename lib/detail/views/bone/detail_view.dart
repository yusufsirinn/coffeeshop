import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../blocs/coffee_bloc/coffee_bloc.dart';
import '../../../core/core.dart';
import '../../../design_system/design_system.dart';
import '../../../order/views/order_page.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  int selectedSizeIndex = 1;
  List<String> coffeeSizeList = ['S', 'M', 'L'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 24),
        child: appBarr(context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 28),
              coffeeImage(context.watch<CoffeeBloc>().state.selectedCoffee.image),
              const SizedBox(height: 20),
              coffeeStarPoint(
                name: context.watch<CoffeeBloc>().state.selectedCoffee.title ?? '',
                ingredients: context.watch<CoffeeBloc>().state.selectedCoffee.ingredients ?? [],
              ),
              const SizedBox(height: 28),
              Divider(
                height: 0,
                color: AppColors.greenWhite,
                thickness: 1,
              ),
              const SizedBox(height: 20),
              title('Description'),
              const SizedBox(height: 15),
              ReadMoreText(
                trimLines: 3,
                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.starDust,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                showLessText: 'Show Less',
                readMoreText: 'Read More',
                readMoreStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.orangeSalmon,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                text: context.watch<CoffeeBloc>().state.selectedCoffee.description ?? '',
              ),
              const SizedBox(height: 22),
              title('Size'),
              const SizedBox(height: 12),
              coffeeSizeTileList()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 110,
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          border: Border(
            top: BorderSide(color: AppColors.seashell),
          ),
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
                  'Price',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.starDust,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  r'$ 4.53',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.orangeSalmon,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            const SizedBox(width: 45),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orangeSalmon,
                  elevation: 0,
                  minimumSize: const Size(0, 55),
                  maximumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  AppNavigator.instance.go(const OrderPage());
                },
                child: Text(
                  'Buy Now',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GridView coffeeSizeTileList() {
    return GridView.builder(
      itemCount: coffeeSizeList.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 14,
        mainAxisExtent: 43,
      ),
      itemBuilder: (context, index) {
        if (selectedSizeIndex == index) {
          return CoffeeSizeTile.selected(text: coffeeSizeList[index]);
        }
        return CoffeeSizeTile.unselected(text: coffeeSizeList[index]);
      },
    );
  }

  Text title(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.thunder,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
    );
  }

  Container coffeeImage(String? image) {
    return Container(
      height: 226,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image ?? ''),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  Widget coffeeStarPoint({
    required String name,
    required List<String> ingredients,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.thunder,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'with ${ingredients.join(', ')}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.starDust,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.star.svg,
                    height: 20,
                  ),
                  const SizedBox(width: 4),
                  RichText(
                    text: TextSpan(
                        text: '4.8',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.thunder, fontSize: 16, fontWeight: FontWeight.w600, shadows: [
                          Shadow(
                            blurRadius: 4,
                            color: Colors.black.withOpacity(.25),
                            offset: const Offset(0, 4),
                          )
                        ]),
                        children: [
                          TextSpan(
                            text: ' (230)',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.granite,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                          )
                        ]),
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              width: 44,
              height: 44,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.forgotMeNot,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Image.asset(
                Images.bean.png,
                height: 24,
              ),
            ),
            const SizedBox(width: 15),
            Container(
              width: 44,
              height: 44,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.forgotMeNot,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Image.asset(
                Images.milk.png,
                height: 24,
              ),
            ),
          ],
        ),
      ],
    );
  }

  SafeArea appBarr(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(AppIcons.arrowLeft.svg),
            Text(
              'Detail',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.thunder,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SvgPicture.asset(AppIcons.lightHeart.svg),
          ],
        ),
      ),
    );
  }
}

class CoffeeSizeTile extends StatelessWidget {
  final Color borderColor;
  final Color color;
  final Color textColor;
  final String text;

  factory CoffeeSizeTile.selected({required String text}) {
    return CoffeeSizeTile(
      borderColor: AppColors.orangeSalmon,
      textColor: AppColors.orangeSalmon,
      color: AppColors.veryLightPink,
      text: text,
    );
  }

  factory CoffeeSizeTile.unselected({required String text}) {
    return CoffeeSizeTile(
      borderColor: AppColors.gainsboro,
      textColor: AppColors.thunder,
      color: Colors.white,
      text: text,
    );
  }

  const CoffeeSizeTile({
    super.key,
    required this.borderColor,
    required this.color,
    required this.textColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
    );
  }
}
