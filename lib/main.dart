import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'blocs/coffee_bloc/coffee_bloc.dart';
import 'core/core.dart';
import 'design_system/design_system.dart';
import 'services/coffee/coffee_service.dart';
import 'views/login/login_page.dart';

Future<void> main() async {
  await AppSetup.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CoffeeBloc>(
          create: (context) => CoffeeBloc(
            service: CoffeeService(),
          ),
        ),
      ],
      child: MaterialApp(
        title: context.tr('appTitle'),
        navigatorKey: AppNavigator.instance.navigatorKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.dune),
          useMaterial3: true,
          textTheme: GoogleFonts.soraTextTheme(),
        ),
        home: const LoginPage(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
