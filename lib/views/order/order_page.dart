import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../blocs/coffee_bloc/coffee_bloc.dart';
import '../../core/core.dart';
import '../../design_system/design_system.dart';
import '../../models/coffee.dart';
import '../delivery/delivery_page.dart';

part 'bone/order_bottom_navigation_bar.dart';
part 'bone/order_counter_tile.dart';
part 'bone/order_price_text.dart';
part 'bone/order_segmented_button.dart';
part 'bone/order_title.dart';

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
        child: CSAppBar(
          title: context.tr('order.title'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            deliver(),
            CSDivider(
              color: AppColors.whiteSmoke,
              thickness: 4,
            ),
            payment()
          ],
        ),
      ),
      bottomNavigationBar: const OrderBottomNavigationBar(),
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
          OrderSegmentedButton(
            selectedGroup: selectedGroup,
            groups: const [
              'Deliver',
              'Pick Up',
            ],
            onValueChanged: (value) {
              setState(
                () {
                  selectedGroup = value.toString();
                },
              );
            },
          ),
          const SizedBox(height: 31),
          const OrderTitle(text: 'order.address.title'),
          const SizedBox(height: 14),
          const OrderTitle(text: 'order.address.address', fontSize: 14),
          const SizedBox(height: 14),
          Text(
            context.tr('order.address.addressPart'),
            style: AppTextStyle.regular12(AppColors.granite),
          ),
          const SizedBox(height: 15),
          const Wrap(
            direction: Axis.horizontal,
            runSpacing: 8,
            spacing: 8,
            children: [
              CSChip(icon: AppIcons.edit, text: 'order.chip.editAddress'),
              CSChip(icon: AppIcons.note, text: 'order.chip.addNote'),
            ],
          ),
          const SizedBox(height: 15),
          const CSDivider(),
          const SizedBox(height: 32),
          OrderCounterTile(coffee: coffee),
          const SizedBox(height: 21),
        ],
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
                const OrderTitle(text: 'order.discount.text', fontSize: 14),
                const Spacer(),
                SvgPicture.asset(AppIcons.arrowRight.svg),
              ],
            ),
          ),
          const SizedBox(height: 21),
          const OrderTitle(text: 'order.payment.title'),
          const SizedBox(height: 9),
          const OrderPriceText(
            text: 'order.payment.price',
            price: r'$ 4.53',
          ),
          const SizedBox(height: 14),
          const OrderPriceText(
            text: 'order.payment.delivery',
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
          const OrderPriceText(
            text: 'order.payment.total',
            price: r'$ 5.53',
          ),
        ],
      ),
    );
  }
}
