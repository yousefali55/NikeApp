import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike/data/get_shoes/cubit/get_shoes_cubit.dart';
import 'package:nike/features/screens/home/home_screen.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed:
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => BlocProvider(
                        create: (context) => GetShoesCubit()..getShoes(),
                        child: const HomeScreen(),
                      ),
                ),
              ),
          child: Text(
            'Test Screen',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
