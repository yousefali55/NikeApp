import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/core/theming/colors.dart';
import 'package:nike/data/get_shoes/cubit/get_shoes_cubit.dart';
import 'package:nike/features/screens/home/widgets/app_bar_home.dart';
import 'package:nike/features/screens/home/widgets/text_field_with_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsManager.offWhite2,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 30),
            AppBarHome(),
            SizedBox(height: 20),
            TextFieldWithIcon(),
            SizedBox(height: 20),
            BlocBuilder<GetShoesCubit, GetShoesState>(
              builder: (context, state) {
                if (state is GetShoesSuccess) {
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 0.6,
                            ),
                        itemCount: state.shoes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.favorite),
                                ),
                                Center(
                                  child: Image.network(
                                    state.shoes[index].image,
                                    fit: BoxFit.cover,
                                    height: 120,
                                    width: 150,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Better Seller',
                                        style: GoogleFonts.raleway(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: ColorsManager.blue,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                        
                                      Text(
                                        state.shoes[index].name
                                            .split(' ')
                                            .take(2)
                                            .join(' ')
                                            .substring(
                                              0,
                                              state.shoes[index].name
                                                  .split(' ')
                                                  .take(2)
                                                  .join(' ')
                                                  .length
                                                  .clamp(0, 15),
                                            ),
                                        style: GoogleFonts.raleway(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '\$${state.shoes[index].price}',
                                        style: GoogleFonts.raleway(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                    ),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      color: ColorsManager.blue,
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {},
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else if (state is GetShoesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetShoesFailure) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: GoogleFonts.raleway(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(
                      'No data available',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        // color: ColorsManager.onboradingBlue,
        buttonBackgroundColor: ColorsManager.blue,
        backgroundColor: ColorsManager.offWhite2,
        items: <Widget>[
          SvgPicture.asset(
            'assets/svgs/home-2.svg',

          ),
          SvgPicture.asset(
            'assets/svgs/heart.svg',
            // color: ColorsManager.blue,
          ),
          SvgPicture.asset(
            'assets/svgs/bag-2.svg',
            // color: ColorsManager.blue,
          ),
          SvgPicture.asset(
            'assets/svgs/Notification.svg',
            // color: ColorsManager.blue,
          ),
          SvgPicture.asset(
            'assets/svgs/profile.svg',
            // color: ColorsManager.blue,
          ),
        ],
      ),
    );
  }
}
