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
                    const SizedBox(height: 62),
                    const HomePageAppBar(),
                    const SizedBox(height: 26),
                    HomePageSearchCoffee(
                      onChanged: (value) {
                        context.read<CoffeeBloc>().add(CoffeeSearch(value));
                      },
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 26),
                            HomePagePromoCard(
                              text: context.tr('home.promoCard.info'),
                            ),
                            const SizedBox(height: 25),
                            ViewStateWidget(
                              status: state.status,
                              success: Column(
                                children: [
                                  HomePageCoffeeTypes(
                                    selectedIndex: context.watch<CoffeeBloc>().state.selectedCoffeeCategoryIndex ?? 0,
                                    coffees:
                                        context.watch<CoffeeBloc>().state.coffees?.map((c) => c.title ?? '').toList() ??
                                            [],
                                    onTap: (index) => context.read<CoffeeBloc>().add(CoffeeCategory(index)),
                                  ),
                                  const SizedBox(height: 17),
                                  HomePageCoffeeGridView(
                                    coffees: state.searchedCoffeeList ?? [],
                                    onTap: (i) {
                                      context.read<CoffeeBloc>().add(CoffeeDetail(i));
                                      AppNavigator.instance.go(const DetailPage());
                                    },
                                  ),
                                ],
                              ),
                              loading: const CSIndicator(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: CSBottomNavigationBarContainer(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(AppIcons.home.svg),
                      SvgPicture.asset(AppIcons.heart.svg),
                      SvgPicture.asset(AppIcons.bag.svg),
                      SvgPicture.asset(AppIcons.notification.svg),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
