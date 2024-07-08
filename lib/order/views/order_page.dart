import '../../blocs/coffee_bloc/coffee_bloc.dart';
import '../../delivery/views/delivery_page.dart';
import '../../models/coffee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/core.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String selectedGroup = 'Deliver';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 24),
        child: appBarr(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            deliver(),
            Divider(
              height: 0,
              color: AppColors.whiteSmoke,
              thickness: 4,
            ),
            payment()
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 140,
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 15,
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
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(AppIcons.moneys.svg),
                const SizedBox(width: 22),
                Container(
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppColors.springWood,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 24,
                        decoration: BoxDecoration(
                          color: AppColors.orangeSalmon,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Cash',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 14,
                        ),
                        child: Text(
                          r'$ 5.53',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.thunder,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(AppIcons.dots.svg),
              ],
            ),
            const SizedBox(height: 17),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orangeSalmon,
                elevation: 0,
                minimumSize: const Size(double.infinity, 55),
                maximumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                AppNavigator.instance.go(const DeliveryPage());
              },
              child: Text(
                'Order',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding payment() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Container(
            height: 56,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.greenWhite),
            ),
            child: Row(
              children: [
                SvgPicture.asset(AppIcons.discount.svg),
                const SizedBox(width: 12),
                title('1 Discount is applied', fontSize: 14),
                const Spacer(),
                SvgPicture.asset(AppIcons.arrowRight.svg),
              ],
            ),
          ),
          const SizedBox(height: 21),
          title('Payment Summary'),
          const SizedBox(height: 9),
          priceText(
            text: 'Price',
            price: r'$ 4.53',
          ),
          const SizedBox(height: 14),
          priceText(
            text: 'Delivery Fee',
            price: r'$ 1.0',
            discount: r'$ 2.0',
          ),
          const SizedBox(height: 21),
          Divider(
            height: 0,
            color: AppColors.greenWhite,
            thickness: 1,
          ),
          const SizedBox(height: 14),
          priceText(
            text: 'Total Payment',
            price: r'$ 5.53',
          ),
        ],
      ),
    );
  }

  Padding deliver() {
    var coffee = context.watch<CoffeeBloc>().state.selectedCoffee;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 26),
          deliverSegmentedButton(),
          const SizedBox(height: 31),
          title('Delivery Address'),
          const SizedBox(height: 14),
          title('Jl. Kpg Sutoyo', fontSize: 14),
          const SizedBox(height: 14),
          address(),
          const SizedBox(height: 15),
          Wrap(
            direction: Axis.horizontal,
            runSpacing: 8,
            spacing: 8,
            children: [
              addressChip(icon: AppIcons.edit, text: 'Edit Address'),
              addressChip(icon: AppIcons.note, text: 'Add Note'),
            ],
          ),
          const SizedBox(height: 15),
          Divider(
            height: 0,
            color: AppColors.greenWhite,
            thickness: 1,
          ),
          const SizedBox(height: 32),
          counterTile(coffee),
          const SizedBox(height: 21),
        ],
      ),
    );
  }

  Row counterTile(Coffee coffee) {
    return Row(
      children: [
        coffeeImage(coffee.image),
        const SizedBox(width: 21),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              coffee.title ?? '',
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.thunder,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              'with ${coffee.ingredients?.first}',
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.starDust,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
        const Spacer(),
        SizedBox(
          width: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              counterButton(AppIcons.minus),
              Text(
                '1',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.thunder,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              counterButton(AppIcons.add),
            ],
          ),
        )
      ],
    );
  }

  Container counterButton(AppIcons icon) {
    return Container(
      width: 30,
      height: 30,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.greenWhite,
        ),
      ),
      child: SvgPicture.asset(icon.svg),
    );
  }

  Container coffeeImage(String? image) {
    return Container(
      height: 54,
      width: 54,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            image ?? '',
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  Widget addressChip({required AppIcons icon, required String text}) {
    return IntrinsicWidth(
      child: Container(
        height: 27,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.gainsboro,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon.svg),
            const SizedBox(width: 4),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.gunmetal,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget priceText({
    required String text,
    required String price,
    String? discount,
  }) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.thunder,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
        ),
        const Spacer(),
        if (discount != null) const SizedBox(width: 8),
        if (discount != null)
          Text(
            discount,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.thunder,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.lineThrough),
          ),
        const SizedBox(width: 8),
        Text(
          price,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.thunder,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }

  Text title(String text, {double fontSize = 16}) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.thunder,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
    );
  }

  Text address() {
    return Text(
      'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.granite,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
    );
  }

  SizedBox deliverSegmentedButton() {
    return SizedBox(
      width: double.infinity,
      child: CupertinoSlidingSegmentedControl<String>(
        padding: const EdgeInsets.all(4),
        groupValue: selectedGroup,
        children: {
          ...segmentText('Deliver'),
          ...segmentText('Pick Up'),
        },
        backgroundColor: AppColors.seashell,
        thumbColor: AppColors.orangeSalmon,
        onValueChanged: (value) {
          setState(
            () {
              selectedGroup = value.toString();
            },
          );
        },
      ),
    );
  }

  Map segmentText(String text) {
    var isSelected = selectedGroup == text;
    return {
      text: SizedBox(
        height: 40,
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isSelected ? Colors.white : AppColors.thunder,
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
          ),
        ),
      )
    };
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
              'Order',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.thunder,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(width: 24),
          ],
        ),
      ),
    );
  }
}
