import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/core/theming/colors.dart';

class FirstOnboadrding extends StatelessWidget {
  const FirstOnboadrding({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorsManager.onboradingBlue,
      child: Column(
        children: [
          SizedBox(height: 30),
          Text(
            'WELCOME TO NIKE',
            style: GoogleFonts.raleway(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: ColorsManager.offWhite,
            ),
          ),
          Stack(
            children: [
              Positioned(
                left: 50,
                child: SvgPicture.asset('assets/svgs/designGroup.svg'),
              ),
              Positioned(
                bottom: 90,
                child: SvgPicture.asset('assets/svgs/nike.svg'),
              ),
              Column(
                children: [
                  Image.asset('assets/images/onboardShoes1.png'),
                  // SmoothPageIndicator(
                  //   controller: _controller,
                  //   count: 3,
                  //   effect: CustomizableEffect(
                  //     dotDecoration: DotDecoration(
                  //       width: 20,
                  //       height: 6,
                  //       color: Colors.orange,
                  //       borderRadius: BorderRadius.circular(24),
                  //     ),
                  //     activeDotDecoration: DotDecoration(
                  //       width: 30,
                  //       height: 6,
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(24),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     minimumSize: Size(350, 50),
          //     backgroundColor: ColorsManager.offWhite,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //   ),
          //   onPressed: () {},
          //   child: Text(
          //     'GET STARTED',
          //     style: GoogleFonts.raleway(
          //       fontSize: 15,
          //       fontWeight: FontWeight.w600,
          //       color: ColorsManager.offBlack,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
