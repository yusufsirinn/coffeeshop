import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../blocs/coffee_bloc/coffee_bloc.dart';
import '../../../core/core.dart';
import '../../../design_system/design_system.dart';
import '../../../detail/views/detail_page.dart';
import '../../../models/coffee.dart';
import '../home_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> coffees = ['Cappuccino', 'Machiato', 'Latte', 'Americano'];
  late int selectedCoffeeIndex = 0;

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
            const BackgroundTile(),
            SafeArea(
              top: false,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  children: [
                    const SizedBox(height: 62),
                    location(context),
                    const SizedBox(height: 26),
                    searchCoffee(context),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 26),
                            promoCard(context),
                            const SizedBox(height: 25),
                            coffeeTypes(context),
                            const SizedBox(height: 17),
                            coffeeList(state.coffees ?? []),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: Container(
                  height: 60,
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

  Widget coffeeList(List<Coffee> coffees) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 9,
        childAspectRatio: 150 / 238,
      ),
      itemCount: coffees.length,
      itemBuilder: (ctx, i) {
        Coffee coffee = coffees[i];
        return Container(
          padding: const EdgeInsets.only(
            left: 4,
            right: 4,
            top: 4,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 141 / 132,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              coffee.image ?? '',
                            ),
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          width: 51,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.16),
                              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20))),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.star.svg,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    '4.8',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6),
                    Text(
                      coffee.title ?? '',
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.thunder,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
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
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      r'$ ' + coffee.price.toString(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.plantation,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    InkWell(
                      onTap: () {
                        context.read<CoffeeBloc>().add(CoffeeDetail(i));
                        AppNavigator.instance.go(const DetailPage());
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.orangeSalmon,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(
                          AppIcons.plus.svg,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  SizedBox coffeeTypes(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: coffees.length,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        shrinkWrap: true,
        separatorBuilder: (_, __) {
          return const SizedBox(width: 7);
        },
        itemBuilder: (ctx, i) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCoffeeIndex = i;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: i == selectedCoffeeIndex ? AppColors.orangeSalmon : AppColors.aquaHaze,
              ),
              child: Text(
                coffees[i],
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: i == selectedCoffeeIndex ? Colors.white : AppColors.plantation,
                      fontSize: 14,
                      fontWeight: i == selectedCoffeeIndex ? FontWeight.w600 : FontWeight.w400,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding promoCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: SizedBox(
        height: 140,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Images.promoCoffee.png),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            Positioned(
              left: 23,
              top: 13,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.valentineRed,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Promo',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  const SizedBox(height: 13),
                  Column(
                    children: [
                      TextWithBackgroundPainter(
                        text: 'Buy one get \none Free',
                        backgroundColor: Colors.black,
                        textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                              fontSize: 32,
                              height: 40 / 32,
                            ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding searchCoffee(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: SizedBox(
        height: 52,
        child: TextField(
          expands: true,
          maxLines: null,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.dune,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            label: Text(
              'Search coffee',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.mountainMist,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 16,
                left: 21,
                right: 12,
              ),
              child: SvgPicture.asset(
                AppIcons.searchNormal.svg,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
            suffixIcon: Container(
              width: 44,
              height: 44,
              margin: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 5,
              ),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.orangeSalmon,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SvgPicture.asset(AppIcons.filter.svg),
            ),
          ),
        ),
      ),
    );
  }

  Widget location(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                        height: 15 / 12,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.24,
                      ),
                ),
                Row(
                  children: [
                    Text(
                      'Bilzen,Tanjungbalai',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                            height: 18 / 14,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(width: 2),
                    SvgPicture.asset(AppIcons.arrowDown.svg)
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.profilePhoto.png),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}
