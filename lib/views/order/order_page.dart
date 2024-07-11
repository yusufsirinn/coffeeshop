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
        preferredSize: const Size(double.infinity, AppDimension.x24),
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
              thickness: AppDimension.x4,
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
      padding: const EdgeInsets.symmetric(horizontal: AppDimension.x30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppDimension.x26),
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
          const SizedBox(height: AppDimension.x30),
          const OrderTitle(text: 'order.address.title'),
          const SizedBox(height: AppDimension.x14),
          const OrderTitle(text: 'order.address.address', fontSize: AppDimension.x14),
          const SizedBox(height: AppDimension.x14),
          Text(
            context.tr('order.address.addressPart'),
            style: AppTextStyle.regular12(AppColors.granite),
          ),
          const SizedBox(height: AppDimension.x16),
          const Wrap(
            direction: Axis.horizontal,
            runSpacing: AppDimension.x8,
            spacing: AppDimension.x8,
            children: [
              CSChip(icon: AppIcons.edit, text: 'order.chip.editAddress'),
              CSChip(icon: AppIcons.note, text: 'order.chip.addNote'),
            ],
          ),
          const SizedBox(height: AppDimension.x16),
          const CSDivider(),
          const SizedBox(height: AppDimension.x32),
          OrderCounterTile(coffee: coffee),
          const SizedBox(height: AppDimension.x20),
        ],
      ),
    );
  }

  Padding payment() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimension.x30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppDimension.x16),
          Container(
            height: AppDimension.x56,
            padding: const EdgeInsets.all(AppDimension.x16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppDimension.x14),
              border: Border.all(color: AppColors.greenWhite),
            ),
            child: Row(
              children: [
                SvgPicture.asset(AppIcons.discount.svg),
                const SizedBox(width: AppDimension.x12),
                const OrderTitle(text: 'order.discount.text', fontSize: AppDimension.x14),
                const Spacer(),
                SvgPicture.asset(AppIcons.arrowRight.svg),
              ],
            ),
          ),
          const SizedBox(height: AppDimension.x20),
          const OrderTitle(text: 'order.payment.title'),
          const SizedBox(height: AppDimension.x8),
          const OrderPriceText(
            text: 'order.payment.price',
            price: r'$ 4.53',
          ),
          const SizedBox(height: AppDimension.x14),
          const OrderPriceText(
            text: 'order.payment.delivery',
            price: r'$ 1.0',
            discount: r'$ 2.0',
          ),
          const SizedBox(height: AppDimension.x20),
          Divider(
            height: 0,
            color: AppColors.greenWhite,
            thickness: 1,
          ),
          const SizedBox(height: AppDimension.x14),
          const OrderPriceText(
            text: 'order.payment.total',
            price: r'$ 5.53',
          ),
        ],
      ),
    );
  }
}
