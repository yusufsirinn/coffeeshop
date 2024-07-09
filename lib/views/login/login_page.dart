import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../../design_system/design_system.dart';
import '../home/home_page.dart';

part 'bone/background_image.dart';
part 'bone/subtitle.dart';
part 'bone/title.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            const BackgroundImage(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Title(),
                const SizedBox(height: 17),
                const Subtitle(),
                const SizedBox(height: 17),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: LoginWithGoogleButton(
                    onTap: () {
                      AppNavigator.instance.go(const HomePage());
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
