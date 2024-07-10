import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';

import '../../core/core.dart';
import '../../design_system/design_system.dart';

part 'bone/delivery_app_bar.dart';
part 'bone/delivery_map.dart';
part 'bone/delivery_order_tile.dart';
part 'bone/delivery_personal_tile.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  final List<LatLng> routePoints = [
    const LatLng(37.882602, 32.444150),
    const LatLng(37.882204, 32.445996),
    const LatLng(37.883220, 32.446350),
    const LatLng(37.883584, 32.445019),
    const LatLng(37.883754, 32.444773),
    const LatLng(37.884389, 32.444901),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        double screenHeight = constraints.maxHeight;
        double minSize = 27 / screenHeight;
        double maxSize = 276 / screenHeight;
        return Stack(
          children: [
            DeliveryMap(
              routePoints: routePoints,
              initialCenter: const LatLng(37.882475, 32.445341),
            ),
            const DeliveryAppBar(),
            DraggableScrollableSheet(
              minChildSize: minSize,
              maxChildSize: maxSize,
              initialChildSize: maxSize,
              builder: (BuildContext context, scrollController) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.greenWhite,
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                              ),
                              height: 6,
                              width: 44,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                            ),
                            Text(
                              context.tr('delivery.order.time'),
                              style: AppTextStyle.semiBold16(AppColors.gunmetal),
                            ),
                            const SizedBox(height: 6),
                            RichText(
                              text: TextSpan(
                                text: context.tr('delivery.order.deliver'),
                                style: AppTextStyle.regular12(AppColors.granite),
                                children: [
                                  TextSpan(
                                    text: context.tr('delivery.order.to'),
                                    style: AppTextStyle.semiBold12(AppColors.gunmetal),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            const CSStepper(
                              currentStep: 3,
                              totalStep: 4,
                            ),
                            const SizedBox(height: 15),
                            const DeliveryOrderTile(),
                            const SizedBox(height: 20),
                            DeliveryPersonalTile(
                              name: context.tr('delivery.personal.name'),
                              info: context.tr('delivery.personal.info'),
                              image: AppImages.personal.png,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      }),
    );
  }
}
