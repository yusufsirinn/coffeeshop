part of '../delivery_page.dart';

class DeliveryMap extends StatelessWidget {
  final List<LatLng> routePoints;
  final LatLng initialCenter;

  const DeliveryMap({
    super.key,
    required this.routePoints,
    required this.initialCenter,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: initialCenter,
        initialZoom: 17.5,
        minZoom: 17.5,
        maxZoom: 20,
      ),
      children: [
        TileLayer(
          urlTemplate: AppConstants.mapURL,
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
        personal(),
        pin(),
      ],
    );
  }

  MarkerLayer personal() {
    return MarkerLayer(
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
                AppImages.bike.png,
              ),
            ),
          ),
        ),
      ],
    );
  }

  MarkerLayer pin() {
    return MarkerLayer(
      markers: [
        Marker(
          alignment: Alignment.topCenter,
          point: routePoints.last,
          width: 24,
          height: 24,
          child: SvgPicture.asset(AppIcons.pin.svg),
        ),
      ],
    );
  }
}
