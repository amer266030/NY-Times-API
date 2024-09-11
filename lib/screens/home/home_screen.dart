import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes/screens/home/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Builder(builder: (context) {
        final cubit = context.read<HomeCubit>();
        cubit.loadData();
        return const Scaffold(
          body: Column(
            children: [
              Text('This is the Home Screen'),
            ],
          ),
        );
      }),
    );
  }
}
