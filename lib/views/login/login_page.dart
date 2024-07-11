import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../../design_system/design_system.dart';
import '../navigation/navigation.dart';

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
                const SizedBox(height: AppDimension.x16),
                const LoginSubtitle(),
                const SizedBox(height: AppDimension.x16),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimension.x30,
                  ),
                  child: LoginWithGoogleButton(
                    onTap: () {
                      AppNavigator.instance.goAndRemove(const Navigation());
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
