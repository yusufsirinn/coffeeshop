import 'package:coffeeshop/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';

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

  final int totalStep = 4;
  final int currentStep = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        double screenHeight = constraints.maxHeight;
        double minSize = 27 / screenHeight;
        double maxSize = 276 / screenHeight;
        return Stack(
          children: [
            map(),
            appBar(),
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
                              '10 minutes left',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.gunmetal,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            const SizedBox(height: 6),
                            RichText(
                              text: TextSpan(
                                text: 'Delivery to ',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: AppColors.granite,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                children: [
                                  TextSpan(
                                    text: 'Jl. Kpg Sutoyo',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          color: AppColors.gunmetal,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            stepper(),
                            const SizedBox(height: 15),
                            deliveredOrder(context),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(Images.personal.png),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Johan Hawn',
                                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                            color: AppColors.gunmetal,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'WPersonal Courier',
                                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                            color: AppColors.granite,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  width: 54,
                                  height: 54,
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(color: AppColors.greenWhite),
                                  ),
                                  child: SvgPicture.asset(AppIcons.telephone.svg),
                                )
                              ],
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

  SafeArea appBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 17,
          horizontal: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            appBarIcon(AppIcons.arrowLeft),
            appBarIcon(AppIcons.gps),
          ],
        ),
      ),
    );
  }

  Container appBarIcon(AppIcons icon) {
    return Container(
      width: 44,
      height: 44,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.plantation.withOpacity(.25),
            blurRadius: 24,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: SvgPicture.asset(icon.svg),
    );
  }

  Container deliveredOrder(BuildContext context) {
    return Container(
      height: 66,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.greenWhite),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 23.5),
      child: Row(
        children: [
          Image.asset(
            Images.bike.png,
          ),
          const SizedBox(width: 25),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivered your order',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.gunmetal,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(width: 5),
                Text(
                  'We deliver your goods to you in the shortes possible time.',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.granite,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox stepper() {
    return SizedBox(
      height: 4,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.greenishTeal,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.greenishTeal,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.greenishTeal,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.lavender,
              ),
            ),
          ),
        ],
      ),
    );
  }

  FlutterMap map() {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(37.882475, 32.445341),
        initialZoom: 17.5,
        minZoom: 17.5,
        maxZoom: 20,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          maxZoom: 20,
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              points: routePoints,
              color: AppColors.orangeSalmon,
              strokeWidth: 4,
            ),
          ],
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: routePoints.first,
              width: 36,
              height: 36,
              child: Container(
                width: 36,
                height: 36,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    color: AppColors.pinkSwan.withOpacity(.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  )
                ]),
                child: Transform.flip(
                  flipX: true,
                  child: Image.asset(
                    Images.bike.png,
                  ),
                ),
              ),
            ),
          ],
        ),
        MarkerLayer(
          markers: [
            Marker(
              alignment: Alignment.topCenter,
              point: routePoints.last,
              width: 24,
              height: 24,
              child: SvgPicture.asset(AppIcons.pin.svg),
            ),
          ],
        ),
      ],
    );
  }
}
