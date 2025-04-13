import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/core/theming/colors.dart';
import 'package:nike/features/reusable_widgets/empty_screen.dart';
import 'package:nike/features/reusable_widgets/first_onboarding.dart';
import 'package:nike/features/screens/home/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController _controller = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier(0);

  void _nextPage(BuildContext context) {
    if (_currentPage.value < 2) {
      _controller.animateToPage(
        _currentPage.value + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(), // استبدل بـ HomeScreen
        ),
      );
      // آخر صفحة - حط هنا التنقل
      print('Navigate to Home/Login');
      // Navigator.pushReplacement(...);
    }
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      _currentPage.value = _controller.page?.round() ?? 0;
    });

    return Scaffold(
      backgroundColor: ColorsManager.onboradingBlue,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                physics: const BouncingScrollPhysics(),
                children: const [
                  FirstOnboadrding(),
                  EmptyScreen(),
                  EmptyScreen(),
                ],
              ),
            ),

            // ✅ Indicator
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: CustomizableEffect(
                  activeDotDecoration: DotDecoration(
                    width: 30,
                    height: 6,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  dotDecoration: DotDecoration(
                    width: 20,
                    height: 6,
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  spacing: 12.0,
                ),
              ),
            ),

            // ✅ Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ValueListenableBuilder<int>(
                valueListenable: _currentPage,
                builder: (context, pageIndex, _) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: ColorsManager.offWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => _nextPage(context),
                    child: Text(
                      pageIndex == 2 ? 'GET STARTED' : 'NEXT',
                      style: GoogleFonts.raleway(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: ColorsManager.offBlack,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
