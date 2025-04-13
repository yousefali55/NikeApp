import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/core/theming/colors.dart';

class TextFieldWithIcon extends StatelessWidget {
  const TextFieldWithIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              hintText: 'Looking for shoes',
              hintStyle: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: ColorsManager.grey,
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: ColorsManager.grey,
                size: 25,
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: ColorsManager.blue,
          child: SvgPicture.asset(
            'assets/svgs/sliders.svg',
            // color: Colors.white,
          ),
        ),
      ],
    );
  }
}
