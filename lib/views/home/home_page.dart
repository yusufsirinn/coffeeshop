import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../blocs/coffee_bloc/coffee_bloc.dart';
import '../../../core/core.dart';
import '../../../design_system/design_system.dart';
import '../../../models/coffee.dart';
import '../detail/detail_page.dart';

part '../home/bone/home_page_app_bar.dart';
part '../home/bone/home_page_coffee_grid_view.dart';
part '../home/bone/home_page_coffee_types.dart';
part '../home/bone/home_page_promo_card.dart';
part '../home/bone/home_page_search_coffee.dart';
part 'bone/home_page_background_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<CoffeeBloc>().add(
            const CoffeeListFetch(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeBloc, CoffeeState>(
      builder: (context, state) {
        return Stack(
          children: [
            const HomePageBackgroundTile(),
            SafeArea(
              top: false,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  children: [
                    const SizedBox(height: AppDimension.x60),
                    const HomePageAppBar(),
                    const SizedBox(height: AppDimension.x28),
                    HomePageSearchCoffee(
                      onChanged: (value) {
                        context.read<CoffeeBloc>().add(CoffeeSearch(value));
                      },
                    ),
                    Expanded(
                      child: ViewStateWidget(
                        status: state.status,
                        success: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: AppDimension.x26),
                              HomePagePromoCard(
                                text: context.tr('home.promoCard.info'),
                              ),
                              const SizedBox(height: AppDimension.x26),
                              HomePageCoffeeTypes(
                                selectedIndex: context.watch<CoffeeBloc>().state.selectedCoffeeCategoryIndex ?? 0,
                                coffees:
                                    context.watch<CoffeeBloc>().state.coffees?.map((c) => c.title ?? '').toList() ?? [],
                                onTap: (index) => context.read<CoffeeBloc>().add(CoffeeCategory(index)),
                              ),
                              const SizedBox(height: AppDimension.x16),
                              CSEmptyList(
                                list: state.searchedCoffeeList,
                                child: HomePageCoffeeGridView(
                                  coffees: state.searchedCoffeeList ?? [],
                                  onTap: (i) {
                                    context.read<CoffeeBloc>().add(CoffeeDetail(i));
                                    AppNavigator.instance.go(const DetailPage());
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        loading: const CSIndicator(),
                        failure: CSInfoText(text: state.errorMessage),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
