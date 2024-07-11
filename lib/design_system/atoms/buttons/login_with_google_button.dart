import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/core.dart';
import '../../design_system.dart';

class LoginWithGoogleButton extends StatelessWidget {
  final Function() onTap;
  const LoginWithGoogleButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppDimension.x54,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimension.x10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.googleLogo.svg,
              height: AppDimension.x24,
              width: AppDimension.x24,
            ),
            const SizedBox(width: AppDimension.x16),
            Text(
              context.tr('login.button'),
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto().copyWith(
                color: Colors.black54,
                fontSize: AppDimension.x20,
                fontWeight: FontWeight.w500,
                letterSpacing: .01,
              ),
            ),
            const SizedBox(width: AppDimension.x10),
          ],
        ),
      ),
    );
  }
}
