import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/core/theming/colors.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/svgs/Hamburger.svg'),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Explore',
              style: GoogleFonts.raleway(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: ColorsManager.offBlack,
              ),
            ),
          ),
        ),
        SvgPicture.asset('assets/svgs/bag.svg'),
      ],
    );
  }
}
