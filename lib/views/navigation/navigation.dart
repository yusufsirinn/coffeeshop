import '../home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/core.dart';
import '../../design_system/design_system.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final _pages = {
    AppIcons.home: const HomePage(),
    AppIcons.heart: Container(),
    AppIcons.bag: Container(),
    AppIcons.notification: Container(),
  };

  AppIcons selectedPage = AppIcons.home;

  void onChangePage(AppIcons page) {
    setState(() {
      selectedPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedPage],
      bottomNavigationBar: SafeArea(
        child: CSBottomNavigationBarContainer(
          height: AppDimension.x60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [..._pages.keys.map((i) => iconButton(i))],
          ),
        ),
      ),
    );
  }

  Widget iconButton(AppIcons page) {
    return IconButton(
      onPressed: () {
        onChangePage(page);
      },
      icon: SvgPicture.asset(
        page.svg,
        colorFilter: ColorFilter.mode(
          page == selectedPage ? AppColors.orangeSalmon : AppColors.osloGrey,
          BlendMode.srcIn,
        ),
        theme: const SvgTheme(
          fontSize: AppDimension.x24,
        ),
      ),
    );
  }
}
