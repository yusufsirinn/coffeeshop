import 'package:flutter/material.dart';

import '../../core/core.dart';
import 'bone/home_view.dart';

part 'bone/background_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}
