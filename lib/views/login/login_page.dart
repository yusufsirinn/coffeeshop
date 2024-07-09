import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../../design_system/design_system.dart';
import '../home/home_page.dart';

part 'bone/login_background_image.dart';
part 'bone/login_subtitle.dart';
part 'bone/login_title.dart';

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
            const LoginBackgroundImage(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const LoginTitle(),
                const SizedBox(height: 17),
                const LoginSubtitle(),
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
