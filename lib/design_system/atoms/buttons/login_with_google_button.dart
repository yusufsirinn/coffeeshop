import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/core.dart';

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
        height: 54,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.googleLogo.svg,
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 15),
            Text(
              context.tr('login.button'),
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto().copyWith(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                letterSpacing: .01,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
